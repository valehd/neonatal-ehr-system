from flask import Blueprint, render_template, request, redirect

from repositories.patient_repository import (
    get_patient_by_id
)

from repositories.control_repository import (
    create_control
)

control_bp = Blueprint(
    "controls",
    __name__
)


@control_bp.route(
    "/patient/<int:id>/new-control",
    methods=["GET", "POST"]
)
def new_control(id):

    patient = get_patient_by_id(id)

    if request.method == "POST":

        control_data = (
            id,
            request.form["control_date"],
            request.form["control_time"],
            request.form["weight"],
            request.form["temperature"],
            request.form["heart_rate"],
            request.form["respiratory_rate"],
            request.form["blood_pressure"],
            request.form["oxygen_saturation"],
            request.form["feeding_type"],
            request.form["feeding_route"],
            request.form["general_condition"],
            request.form["muscle_tone"],
            request.form["skin_condition"],
            request.form["oxygen_support"],
            request.form["bed_type"],
            request.form["incubator_temperature"],
            request.form["position_changed"],
            request.form["morning_hygiene"],
            request.form["observations"]
        )

        create_control(control_data)

        return redirect(f"/patient/{id}")

    return render_template(
        "new_control.html",
        patient=patient
    )