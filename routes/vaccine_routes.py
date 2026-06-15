from flask import Blueprint, render_template, request, redirect
from repositories import vaccine_repository (
    get_vaccines_by_patient_id),
from repositories import vaccine_repository (
    create_vaccine)

@vaccine_bp.route(
    "/patient/<int:id>/new-vaccine",
    methods=["GET", "POST"]
)
def new_vaccine(id):

    patient = get_patient_by_id(id)

    if request.method == "POST":

        vaccine_data = (
            id,
            request.form["vaccine_name"],
            request.form["administration_date"],
            request.form["dose"],
            request.form["batch_number"],
            request.form["administration_site"],
            request.form["observations"]
        )

        create_vaccine(vaccine_data)

        return redirect(
            f"/patient/{id}"
        )

    return render_template(
        "new_vaccine.html",
        patient=patient
    )