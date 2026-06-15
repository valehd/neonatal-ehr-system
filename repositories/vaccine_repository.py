from database.database import connection


def get_vaccines_by_patient_id(patient_id):

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT *
        FROM neonatal_vaccines
        WHERE patient_id = %s
        ORDER BY administration_date DESC
        """,
        (patient_id,)
    )

    vaccines = cursor.fetchall()

    cursor.close()

    return vaccines


def create_vaccine(vaccine_data):

    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO neonatal_vaccines (
            patient_id,
            vaccine_name,
            administration_date,
            dose,
            batch_number,
            administration_site,
            observations
        )
        VALUES (
            %s,%s,%s,%s,%s,%s,%s
        )
        """,
        vaccine_data
    )

    connection.commit()
    cursor.close()