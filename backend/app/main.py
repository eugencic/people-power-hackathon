from flask import Flask, jsonify
import psycopg2
from psycopg2 import sql

app = Flask(__name__)

db_params = {
    'dbname': 'database',
    'user': 'postgres',
    'password': 'password',
    'host': 'localhost',
    'port': '5435'
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


if __name__ == '__main__':
    app.run(debug=True)
