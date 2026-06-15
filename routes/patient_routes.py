from flask import Blueprint, render_template, request, redirect

from repositories.patient_repository import (
    get_all_patients,
    get_patient_by_id,
    create_patient
)

from repositories.control_repository import (
    get_controls_by_patient_id
)

from repositories.medication_repository import (
    get_medications_by_patient_id
)
from services.patient_service import build_patient_summary
from repositories.vaccine_repository import get_vaccines_by_patient_id

patient_bp = Blueprint("patients", __name__)



@patient_bp.route("/")
def patients():

    patients = get_all_patients()

    return render_template(
        "patients.html",
        patients=patients
    )


@patient_bp.route(
    "/new-patient",
    methods=["GET", "POST"]
)
def new_patient():

    if request.method == "POST":

        patient_data = (
            request.form["first_name"],
            request.form["last_name"],
            request.form["sex"],
            request.form["gestational_age"],
            request.form["birth_weight"],
            request.form["date_of_birth"],
            request.form["time_of_birth"],
            request.form["delivery_type"],
            request.form["birth_length"],
            request.form["head_circumference"],
            request.form["growth_percentile"],
            request.form["apgar_1_min"],
            request.form["apgar_5_min"],
            request.form["resuscitation_required"],
            request.form["medical_record_number"],
            request.form["national_id"],
            request.form["health_insurance"]
        )

        create_patient(patient_data)

        return redirect("/")

    return render_template("new_patient.html")



@patient_bp.route("/patient/<int:id>")
def patient_detail(id):

    patient = get_patient_by_id(id)

    controls = get_controls_by_patient_id(id)
    
    medications = get_medications_by_patient_id(id)

    vaccines= get_vaccines_by_patient_id(id)

    summary = build_patient_summary(
        patient,
        controls
    )


    return render_template(
        "patient_detail.html",
        patient=patient,
        controls=controls,
        medications=medications,
        vaccines= vaccines,
        summary=summary
    )