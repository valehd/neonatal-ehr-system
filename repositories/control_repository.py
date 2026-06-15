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



def create_control(control_data):

    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO neonatal_controls (
            patient_id,
            control_date,
            control_time,
            weight,
            temperature,
            heart_rate,
            respiratory_rate,
            blood_pressure,
            oxygen_saturation,
            feeding_type,
            feeding_route,
            general_condition,
            muscle_tone,
            skin_condition,
            oxygen_support,
            bed_type,
            incubator_temperature,
            position_changed,
            morning_hygiene,
            observations
        )
        VALUES (
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s
        )
        """,
        control_data
    )

    connection.commit()
    cursor.close()