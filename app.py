from flask import Flask, render_template
import os
from dotenv import load_dotenv
import mysql.connector


load_dotenv()

app = Flask(__name__)

connection = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)


@app.route("/")
def patients():
     cursor = connection.cursor(dictionary=True)

     cursor.execute("SELECT * FROM patients")

     patients = cursor.fetchall()

     return render_template(
        "patients.html",
        patients=patients
    )

    



@app.route("/new-patient")
def new_patient():
    return render_template("new_patient.html")


@app.route("/patient/<int:id>")
def patient_detail(id):
    return render_template("patient_detail.html")


if __name__ == "__main__":
    app.run(debug=True)