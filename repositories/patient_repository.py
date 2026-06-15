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



def create_patient(patient_data):

    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO patients (
            first_name,
            last_name,
            sex,
            gestational_age,
            birth_weight,
            date_of_birth,
            time_of_birth,
            delivery_type,
            birth_length,
            head_circumference,
            growth_percentile,
            apgar_1_min,
            apgar_5_min,
            resuscitation_required,
            medical_record_number,
            national_id,
            health_insurance
        )
        VALUES (
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s,
            %s,%s,%s,%s,%s,
            %s,%s
        )
        """,
        patient_data
    )

    connection.commit()
    cursor.close()