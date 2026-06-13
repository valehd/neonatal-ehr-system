from database.database import connection


def get_controls_by_patient_id(patient_id):

    cursor = connection.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT *
        FROM neonatal_controls
        WHERE patient_id = %s
        ORDER BY control_date DESC,
                 control_time DESC
        """,
        (patient_id,)
    )

    controls = cursor.fetchall()

    cursor.close()

    return controls