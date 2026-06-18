from database.database import connection


def get_diagnoses_by_patient_id(patient_id):

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT *
        FROM neonatal_diagnoses
        WHERE patient_id = %s
        ORDER BY priority ASC,
            diagnosis_date DESC
        """,
        (patient_id,)
    )

    diagnoses = cursor.fetchall()

    cursor.close()

    return diagnoses


def create_diagnosis(diagnosis_data):

    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO neonatal_diagnoses (
            patient_id,
            diagnosis_name,
            icd10_code,
            diagnosis_date,
            status,
            observations
        )
        VALUES (
            %s,%s,%s,%s,%s,%s
        )
        """,
        diagnosis_data
    )

    connection.commit()
    cursor.close()