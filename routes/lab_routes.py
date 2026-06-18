from flask import Blueprint, render_template, request, redirect

from repositories.patient_repository import (
get_patient_by_id
)

from repositories.lab_repository import (
get_labs_by_patient_id,
create_lab
)

lab_bp = Blueprint(
"labs", __name__
)

@lab_bp.route(
"/patient/<int:id>/labs"
)
def patient_labs(id):


    patient = get_patient_by_id(id)

    labs = get_labs_by_patient_id(id)

    return render_template(
    "patient_labs.html",
    patient=patient,
    labs=labs
)


@lab_bp.route(
"/patient/<int:id>/new-lab",
methods=["GET", "POST"]
)
def new_lab(id):


    patient = get_patient_by_id(id)

    if request.method == "POST":

        lab_data = (
        id,
        request.form["test_date"],
        request.form["test_name"],
        request.form["result"],
        request.form["unit"],
        request.form["reference_range"],
        request.form["observations"]
    )

        create_lab(lab_data)

        return redirect(
        f"/patient/{id}/labs"
    )

    return render_template(
    "new_lab.html",
    patient=patient
)

