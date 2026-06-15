from flask import Blueprint
from flask import render_template
from flask import request
from flask import redirect

from repositories.patient_repository import get_patient_by_id
from repositories.medication_repository import create_medication

medication_bp = Blueprint(
    "medications",
    __name__
)

@medication_bp.route(
    "/patient/<int:id>/new-medication",
    methods=["GET", "POST"]
)
def new_medication(id):

    patient = get_patient_by_id(id)

    if request.method == "POST":

        medication_data = (
            id,
            request.form["medication_name"],
            request.form["dose"],
            request.form["route"],
            request.form["frequency"],
            request.form["start_date"],
            request.form["end_date"],
            request.form["observations"]
        )

        create_medication(
            medication_data
        )

        return redirect(
            f"/patient/{id}"
        )

    return render_template(
        "new_medication.html",
        patient=patient
    )