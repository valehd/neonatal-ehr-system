from database.database import connection

def get_labs_by_patient_id(patient_id):


    cursor = connection.cursor(dictionary=True)

    cursor.execute(
    """
    SELECT *
    FROM neonatal_labs
    WHERE patient_id = %s
    ORDER BY test_date DESC
    """,
    (patient_id,)
)

    labs = cursor.fetchall()

    cursor.close()

    return labs


def create_lab(lab_data):


    cursor = connection.cursor()

    cursor.execute(
    """
    INSERT INTO neonatal_labs (
        patient_id,
        test_date,
        test_name,
        result,
        unit,
        reference_range,
        observations
    )
    VALUES (
        %s,%s,%s,%s,%s,%s,%s
    )
    """,
    lab_data
)

    connection.commit()

    cursor.close()
