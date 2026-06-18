
CREATE DATABASE neonatal_ehr;
USE neonatal_ehr;

-- ==========================================
-- PATIENTS
-- ==========================================
CREATE TABLE patients (
    patient_id          INT AUTO_INCREMENT PRIMARY KEY,
    first_name          VARCHAR(50) NOT NULL,
    last_name           VARCHAR(50) NOT NULL,
    sex                 ENUM('Male', 'Female', 'Other'),
    gestational_age     INT,
    birth_weight_g      INT,           -- weight in grams
    birth_length        DECIMAL(5,2),
    head_circumference  DECIMAL(5,2),
    growth_percentile   DECIMAL(5,2),  -- allows 98.5 etc.
    date_of_birth       DATE,
    time_of_birth       TIME,
    delivery_type       VARCHAR(50),
    apgar_1_min         INT,
    apgar_5_min         INT,
    resuscitation_required BOOLEAN,
    medical_record_number  VARCHAR(30),
    national_id         VARCHAR(20),
    health_insurance    VARCHAR(50),
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- NEONATAL CONTROLS
-- ==========================================
CREATE TABLE neonatal_controls (
    control_id          INT AUTO_INCREMENT PRIMARY KEY,
    patient_id          INT NOT NULL,
    control_date        DATE NOT NULL,
    control_time        TIME NOT NULL,
    care_level          VARCHAR(30),
    weight_g            INT,
    temperature         DECIMAL(4,1),
    heart_rate          INT,
    respiratory_rate    INT,
    bp_systolic         INT,           -- split for querying
    bp_diastolic        INT,
    oxygen_saturation   DECIMAL(5,2),  -- e.g. 98.5
    feeding_type        VARCHAR(50),
    feeding_route       VARCHAR(50),
    general_condition   VARCHAR(50),
    muscle_tone         VARCHAR(50),
    skin_condition      VARCHAR(50),
    oxygen_support      BOOLEAN,
    bed_type            VARCHAR(30),
    incubator_temperature DECIMAL(4,1),
    position_changed    BOOLEAN,
    morning_hygiene     BOOLEAN,
    observations        TEXT,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE
);

-- ==========================================
-- MEDICATIONS
-- ==========================================
CREATE TABLE neonatal_medications (
    medication_id              INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dose            VARCHAR(50),
    route           VARCHAR(50),
    frequency       VARCHAR(50),
    start_date      DATE NOT NULL,
    end_date        DATE,
    observations    TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE
);

-- ==========================================
-- VACCINES
-- ==========================================
CREATE TABLE neonatal_vaccines (
    vaccine_id                  INT AUTO_INCREMENT PRIMARY KEY,
    patient_id          INT NOT NULL,
    vaccine_name        VARCHAR(100) NOT NULL,
    administration_date DATE NOT NULL,
    dose                VARCHAR(50),
    batch_number        VARCHAR(100),
    administration_site VARCHAR(100),
    observations        TEXT,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE
);

-- ==========================================
-- LABS
-- ==========================================
CREATE TABLE neonatal_labs (
    lab_id              INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    test_date       DATE NOT NULL,
    test_name       VARCHAR(100) NOT NULL,
    result          VARCHAR(100) NOT NULL,
    unit            VARCHAR(50),
    reference_range VARCHAR(100),
    observations    TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE
);

-- ==========================================
-- DIAGNOSES
-- ==========================================
CREATE TABLE neonatal_diagnoses (
    diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,

    patient_id INT NOT NULL,

    diagnosis_name VARCHAR(255) NOT NULL,

    icd10_code VARCHAR(20),

    diagnosis_date DATE NOT NULL,

    status VARCHAR(50) DEFAULT 'Active',

    priority INT DEFAULT 99,

    observations TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE
);

