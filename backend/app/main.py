from flask import Flask, flash, request, redirect, send_file, jsonify
from flask_cors import CORS
import psycopg2
from psycopg2 import sql
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
CORS(app)

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
        query = sql.SQL("UPDATE projects SET project_pdf_file_name = %s WHERE project_id = %s")
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


def get_projects_and_expenses_by_region_and_year(region_id, year):
    try:
        conn = psycopg2.connect(**db_params)
        cursor = conn.cursor()

        query = sql.SQL("""
            SELECT
                proj.project_id,
                proj.project_name,
                proj.project_description,
                proj.budget_id,
                proj.project_status,
                proj.category_id,
                proj.project_pdf_file_name,
                proj.likes,
                proj.dislikes,
                proj.votes,
                proj.necessary_budget,
                proj.allocated_budget,
                proj.used_budget,
                rb.budget_id AS rb_budget_id,
                rb.budget_amount AS rb_budget_amount,
                rb.budget_year AS rb_budget_year,
                rb.region_id AS rb_region_id,
                c.category_name,
                json_agg(json_build_object(
                    'expense_id', e.expense_id,
                    'expense_name', e.expense_name,
                    'expense_amount', e.expense_amount,
                    'expense_pdf_file_name', e.expense_pdf_file_name
                )) AS expenses
            FROM
                region r
                JOIN region_budget rb ON r.region_id = rb.region_id
                JOIN project proj ON rb.budget_id = proj.budget_id
                LEFT JOIN expense e ON proj.project_id = e.project_id
                LEFT JOIN category c ON proj.category_id = c.category_id
            WHERE
                r.region_id = %s AND rb.budget_year = %s
            GROUP BY
                proj.project_id,
                rb.budget_id,
                c.category_name
        """)
        cursor.execute(query, (region_id, year))
        columns = [desc[0] for desc in cursor.description]
        unique_projects_with_expenses = [dict(zip(columns, row)) for row in cursor.fetchall()]
        conn.commit()
        cursor.close()
        conn.close()
        return unique_projects_with_expenses
    except psycopg2.Error as e:
        print("Error connecting to PostgreSQL:", e)
        return []


@app.route('/api/region/<int:region_id>/<int:year>', methods=['GET'])
def get_projects_and_expenses_by_region_and_year_endpoint(region_id, year):
    projects_and_expenses = get_projects_and_expenses_by_region_and_year(region_id, year)
    return jsonify(projects_and_expenses)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
