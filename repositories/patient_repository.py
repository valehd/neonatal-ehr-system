from database.database import connection

def get_all_patients():

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM patients"
    )

    patients = cursor.fetchall()

    cursor.close()

    return patients


def get_patient_by_id(patient_id):

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM patients WHERE patient_id = %s",
        (patient_id,)
    )

    patient = cursor.fetchone()

    cursor.close()

    return patient