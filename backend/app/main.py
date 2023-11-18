from flask import Flask, flash, request, redirect, send_file, jsonify
import psycopg2
from psycopg2 import sql
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)

db_params = {
    'dbname': 'database',
    'user': 'postgres',
    'password': 'password',
    'host': 'database',
    # 'host': 'localhost',
    # 'port': '5435'
}


def get_all_records(table_name):
    try:
        conn = psycopg2.connect(**db_params)
        cursor = conn.cursor()
        query = sql.SQL("SELECT * FROM {}").format(sql.Identifier(table_name))
        cursor.execute(query)
        columns = [desc[0] for desc in cursor.description]
        records = [dict(zip(columns, row)) for row in cursor.fetchall()]
        conn.commit()
        cursor.close()
        conn.close()
        return records
    except psycopg2.Error as e:
        print("Error connecting to PostgresSQL:", e)
        return []


@app.route('/api/<table_name>', methods=['GET'])
def get_records(table_name):
    records = get_all_records(table_name)
    return jsonify(records)


UPLOAD_FOLDER = './storage'
ALLOWED_EXTENSIONS = {'pdf'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def save_pdf_to_db(project_id, filename):
    try:
        conn = psycopg2.connect(**db_params)
        cursor = conn.cursor()
        query = sql.SQL("UPDATE projects SET pdf_file = %s WHERE project_id = %s")
        cursor.execute(query, (filename, project_id))
        conn.commit()
        cursor.close()
        conn.close()
    except psycopg2.Error as e:
        print("Error connecting to PostgresSQL:", e)


@app.route('/api/send_pdf', methods=['GET', 'POST'])
def send_pdf():
    if 'file' not in request.files or 'project_id' not in request.form:
        flash('Invalid request')
        return redirect(request.url)
    file = request.files['file']
    project_id = request.form['project_id']
    if file.filename == '':
        flash('No selected file')
        return redirect(request.url)
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        save_pdf_to_db(project_id, filename)
        return jsonify({"success": True, "message": "File uploaded and database updated successfully"})
    return jsonify({"success": False, "message": "Invalid file format"})


@app.route("/api/get_pdf/<string:filename>")
def return_pdf(filename):
    return send_file(f"./storage/{filename}")


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
