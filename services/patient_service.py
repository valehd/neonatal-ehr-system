from datetime import date


def build_patient_summary(patient, controls):

    summary = {
        "days_of_life": None,
        "current_weight": None,
        "latest_temperature": None,
        "latest_sat": None,
        "latest_heart_rate": None,
        "latest_respiratory_rate": None
    }

    # Days of life

    if patient and patient["date_of_birth"]:

        summary["days_of_life"] = (
            date.today() - patient["date_of_birth"]
        ).days

    # Latest control

    if controls:

        latest_control = controls[0]

        summary["current_weight"] = latest_control["weight"]
        summary["latest_temperature"] = latest_control["temperature"]
        summary["latest_sat"] = latest_control["oxygen_saturation"]
        summary["latest_heart_rate"] = latest_control["heart_rate"]
        summary["latest_respiratory_rate"] = latest_control["respiratory_rate"]

    return summary