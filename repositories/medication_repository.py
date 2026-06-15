from database.database import connection


def get_medications_by_patient_id(patient_id):

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT *
        FROM neonatal_medications
        WHERE patient_id = %s
        ORDER BY start_date DESC
        """,
        (patient_id,)
    )

    medications = cursor.fetchall()

    cursor.close()

    return medications




def create_medication(medication_data):

    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO neonatal_medications (
            patient_id,
            medication_name,
            dose,
            route,
            frequency,
            start_date,
            end_date,
            observations
        )
        VALUES (
            %s,%s,%s,%s,
            %s,%s,%s,%s
        )
        """,
        medication_data
    )

    connection.commit()
    cursor.close()