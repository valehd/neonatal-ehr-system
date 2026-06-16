from flask import Blueprint, render_template, request, redirect

from repositories.patient_repository import (
    get_patient_by_id
)

from repositories.diagnosis_repository import (
    create_diagnosis
)

diagnosis_bp = Blueprint(
    "diagnoses",
    __name__
)


@diagnosis_bp.route(
    "/patient/<int:id>/new-diagnosis",
    methods=["GET", "POST"]
)
def new_diagnosis(id):

    patient = get_patient_by_id(id)

    if request.method == "POST":

        diagnosis_data = (
            id,
            request.form["diagnosis_name"],
            request.form["icd10_code"],
            request.form["diagnosis_date"],
            request.form["status"],
            request.form["observations"]
        )

        create_diagnosis(diagnosis_data)

        return redirect(
            f"/patient/{id}"
        )

    return render_template(
        "new_diagnosis.html",
        patient=patient
    )