from flask import Flask, render_template, request, redirect
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

    



@app.route("/new-patient", methods=["GET", "POST"])
def new_patient():
    if request.method == "POST":
        first_name = request.form["first_name"]
        last_name = request.form["last_name"]
        sex = request.form["sex"]
        gestational_age = request.form["gestational_age"]
        birth_weight = request.form["birth_weight"]
        date_of_birth = request.form["date_of_birth"]
        time_of_birth = request.form["time_of_birth"]
        delivery_type = request.form["delivery_type"]
        birth_length = request.form["birth_length"]
        head_circumference = request.form["head_circumference"]
        growth_percentile = request.form["growth_percentile"]
        apgar_1_min = request.form["apgar_1_min"]
        apgar_5_min = request.form["apgar_5_min"]
        resuscitation_required = request.form["resuscitation_required"]
        medical_record_number = request.form["medical_record_number"]
        national_id = request.form["national_id"]
        health_insurance = request.form["health_insurance"]

        cursor = connection.cursor()
        cursor.execute(
            "INSERT INTO patients (first_name, last_name, sex, gestational_age, birth_weight, date_of_birth, time_of_birth, delivery_type, birth_length, head_circumference, growth_percentile, apgar_1_min, apgar_5_min, resuscitation_required, medical_record_number, national_id, health_insurance) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (first_name, last_name, sex, gestational_age, birth_weight, date_of_birth, time_of_birth, delivery_type, birth_length, head_circumference, growth_percentile, apgar_1_min, apgar_5_min, resuscitation_required, medical_record_number, national_id, health_insurance)
        )
        connection.commit()
        cursor.close()

        return redirect("/")

    return render_template("new_patient.html")


@app.route("/patient/<int:id>")
def patient_detail(id):
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM patients WHERE patient_id = %s", (id,))
    patient = cursor.fetchone()
    return render_template("patient_detail.html", patient=patient)
    


if __name__ == "__main__":
    app.run(debug=True)