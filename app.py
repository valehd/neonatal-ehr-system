from flask import Flask, render_template, request, redirect
import os
from database.database import connection
from repositories.patient_repository import get_all_patients
from repositories.patient_repository import get_patient_by_id

from repositories.control_repository import get_controls_by_patient_id


app = Flask(__name__)



@app.route("/")
def patients():
     patients= get_all_patients()
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

    patient= get_patient_by_id(id)
    controls= get_controls_by_patient_id(id)

    return render_template(
        "patient_detail.html",
        patient=patient,
        controls=controls
    )

@app.route("/patient/<int:id>/new-control", methods=["GET", "POST"])
def new_control(id):

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
    "SELECT * FROM patients WHERE patient_id = %s",
    (id,)
)

    patient = cursor.fetchone()

    if request.method == "POST":

        control_date = request.form["control_date"]
        control_time = request.form["control_time"]

        weight = request.form["weight"]

        temperature = request.form["temperature"]
        heart_rate = request.form["heart_rate"]
        respiratory_rate = request.form["respiratory_rate"]

        blood_pressure = request.form["blood_pressure"]
        oxygen_saturation = request.form["oxygen_saturation"]

        feeding_type = request.form["feeding_type"]
        feeding_route = request.form["feeding_route"]

        general_condition = request.form["general_condition"]
        muscle_tone = request.form["muscle_tone"]
        skin_condition = request.form["skin_condition"]

        oxygen_support = request.form["oxygen_support"]

        bed_type = request.form["bed_type"]
        incubator_temperature = request.form["incubator_temperature"]

        position_changed = request.form["position_changed"]
        morning_hygiene = request.form["morning_hygiene"]

        observations = request.form["observations"]

        cursor.execute(
        """
        INSERT INTO neonatal_controls (
            patient_id,
            control_date,
            control_time,
            weight,
            temperature,
            heart_rate,
            respiratory_rate,
            blood_pressure,
            oxygen_saturation,
            feeding_type,
            feeding_route,
            general_condition,
            muscle_tone,
            skin_condition,
            oxygen_support,
            bed_type,
            incubator_temperature,
            position_changed,
            morning_hygiene,
            observations
        )
        VALUES (
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s
        )
        """,
        (
            id,
            control_date,
            control_time,
            weight,
            temperature,
            heart_rate,
            respiratory_rate,
            blood_pressure,
            oxygen_saturation,
            feeding_type,
            feeding_route,
            general_condition,
            muscle_tone,
            skin_condition,
            oxygen_support,
            bed_type,
            incubator_temperature,
            position_changed,
            morning_hygiene,
            observations
        )
    )

        connection.commit()
        return redirect(f"/patient/{id}")

    return render_template(
    "new_control.html",
    patient=patient
)



if __name__ == "__main__":
    app.run(debug=True)