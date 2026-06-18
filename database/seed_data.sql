


USE neonatal_ehr;

-- ============================================================
-- PATIENTS
-- ============================================================
INSERT INTO patients (
    first_name, last_name, sex, gestational_age, birth_weight_g,
    birth_length, head_circumference, growth_percentile,
    date_of_birth, time_of_birth, delivery_type,
    apgar_1_min, apgar_5_min, resuscitation_required,
    medical_record_number, national_id, health_insurance
) VALUES
-- P1: Extreme premature 26w — RDS, sepsis, IVH
('Matias', 'Gonzalez', 'Male', 26, 780,
 30.5, 24.0, 5,
 '2025-10-03', '03:22:00', 'Cesarean',
 2, 4, TRUE,
 'MRN-001', '20241003-01', 'Public'),

-- P2: Term newborn with perinatal asphyxia — HIE
('Valentina', 'Reyes', 'Female', 39, 3250,
 50.0, 34.5, 45,
 '2025-11-15', '14:10:00', 'Vaginal',
 3, 6, TRUE,
 'MRN-002', '20241115-02', 'Private'),

-- P3: Term newborn — severe hyperbilirubinemia + ABO incompatibility
('Sebastian', 'Morales', 'Male', 40, 3680,
 51.5, 35.0, 60,
 '2025-12-01', '09:45:00', 'Vaginal',
 8, 9, FALSE,
 'MRN-003', '20241201-03', 'Public'),


-- ============================================================
-- NEONATAL CONTROLS
-- ============================================================

-- P1 — Extreme premature (26w, 780g)
INSERT INTO neonatal_controls (
    patient_id, control_date, control_time, care_level,
    weight_g, temperature, heart_rate, respiratory_rate,
    bp_systolic, bp_diastolic, oxygen_saturation,
    feeding_type, feeding_route, general_condition,
    muscle_tone, skin_condition, oxygen_support, bed_type,
    incubator_temperature, position_changed, morning_hygiene, observations
) VALUES
(1, '2025-10-03', '06:00:00', 'NICU',
 780, 36.8, 172, 68, 38, 22, 88.0,
 'Parenteral', 'IV', 'Critical', 'Hypotonic', 'Cyanotic', TRUE, 'Incubator',
 37.5, TRUE, FALSE, 'Intubated at birth. Surfactant 100mg/kg administered. Grade II IVH on cranial ultrasound. Umbilical venous access placed.'),

(1, '2025-10-05', '06:00:00', 'NICU',
 760, 37.1, 168, 62, 40, 24, 90.0,
 'Parenteral', 'IV', 'Critical', 'Hypotonic', 'Pale', TRUE, 'Incubator',
 37.5, TRUE, TRUE, 'Remains on mechanical ventilation. Blood culture positive for CoNS. Ampicillin + gentamicin started. Adequate urine output.'),

(1, '2025-10-08', '06:00:00', 'NICU',
 755, 36.9, 165, 58, 42, 26, 91.5,
 'Parenteral', 'IV', 'Serious', 'Hypotonic', 'Pale', TRUE, 'Incubator',
 37.2, TRUE, TRUE, 'Stable on MV. Sepsis under treatment. RBC transfusion 15ml/kg for anemia (Hct 28%).'),

(1, '2025-10-12', '08:00:00', 'NICU',
 790, 37.0, 162, 55, 44, 28, 93.0,
 'Mixed', 'OG + IV', 'Serious', 'Hypotonic', 'Pale', TRUE, 'Incubator',
 37.0, TRUE, TRUE, 'Extubated to nasal CPAP. Minimal enteral feeding started at 1ml/kg/h. Blood cultures now negative.'),

(1, '2025-10-16', '08:00:00', 'NICU',
 830, 36.8, 158, 52, 46, 30, 94.5,
 'Mixed', 'OG + IV', 'Serious', 'Low', 'Pale', TRUE, 'Incubator',
 36.8, TRUE, TRUE, 'On CPAP. Tolerating enteral 10ml/kg/day. Occasional apneas. Caffeine ongoing.'),

(1, '2025-10-21', '08:00:00', 'NICU',
 890, 37.0, 155, 48, 48, 31, 95.0,
 'Enteral', 'OG', 'Serious', 'Low', 'Pale', TRUE, 'Incubator',
 36.5, TRUE, TRUE, 'CPAP weaned to O2 hood at 21%. Enteral feeds increased to 80ml/kg/day. No apneas in last 48h.'),

(1, '2025-10-27', '08:00:00', 'Intermediate',
 970, 36.9, 150, 45, 50, 32, 96.0,
 'Enteral', 'OG', 'Moderate', 'Low', 'Pale', FALSE, 'Incubator',
 36.2, TRUE, TRUE, 'No supplemental oxygen needed. Enteral 120ml/kg/day fortified breast milk. Monitoring for apneas.'),

(1, '2025-11-03', '08:00:00', 'Intermediate',
 1080, 37.1, 148, 44, 52, 33, 96.5,
 'Enteral', 'OG', 'Moderate', 'Low', 'Normal', FALSE, 'Incubator',
 35.8, TRUE, TRUE, 'Good progress. Non-nutritive sucking initiated. Mild anemia (Hct 32%), no transfusion required.'),

(1, '2025-11-12', '08:00:00', 'Intermediate',
 1210, 37.0, 145, 42, 53, 34, 97.0,
 'Enteral', 'Breast + OG', 'Moderate', 'Normal', 'Normal', FALSE, 'Incubator',
 35.5, TRUE, TRUE, 'Sporadic breastfeeding attempts. Enteral 150ml/kg/day. Weight gain 18g/day.'),

(1, '2025-11-21', '08:00:00', 'Intermediate',
 1390, 37.0, 142, 40, 54, 34, 97.5,
 'Enteral', 'Breast + Cup', 'Stable', 'Normal', 'Normal', FALSE, 'Incubator',
 35.2, TRUE, TRUE, 'Patient stable. Breast + supplement. Preparing for discharge when weight reaches 1800g.');

-- P2 — Perinatal asphyxia, moderate HIE (39w, 3250g)
INSERT INTO neonatal_controls (
    patient_id, control_date, control_time, care_level,
    weight_g, temperature, heart_rate, respiratory_rate,
    bp_systolic, bp_diastolic, oxygen_saturation,
    feeding_type, feeding_route, general_condition,
    muscle_tone, skin_condition, oxygen_support, bed_type,
    incubator_temperature, position_changed, morning_hygiene, observations
) 
VALUES
(2, '2025-11-15', '16:30:00', 'NICU',
 3250, 33.5, 110, 40, 55, 35, 90.0,
 'Parenteral', 'IV', 'Critical', 'Hypotonic', 'Mottled', TRUE, 'Open crib with cooling blanket',
 NULL, FALSE, FALSE, 'Therapeutic hypothermia initiated (33.5 degrees C). Intubated. Tonic seizure 2min. Phenobarbital 20mg/kg loading dose given.'),

(2, '2025-11-16', '08:00:00', 'NICU',
 3210, 33.5, 108, 38, 57, 36, 91.0,
 'Parenteral', 'IV', 'Critical', 'Hypotonic', 'Mottled', TRUE, 'Open crib with cooling blanket',
 NULL, TRUE, FALSE, 'Hypothermia hour 24. No new seizures. EEG: burst suppression pattern. Renal function compromised: Cr 1.8.'),

(2, '2025-11-17', '08:00:00', 'NICU',
 3190, 33.5, 110, 36, 58, 37, 92.0,
 'Parenteral', 'IV', 'Serious', 'Hypotonic', 'Pale', TRUE, 'Open crib with cooling blanket',
 NULL, TRUE, FALSE, 'Hypothermia hour 48. EEG improving. Labile blood glucose. Amino acids adjusted. Cr 1.4.'),

(2, '2025-11-18', '08:00:00', 'NICU',
 3180, 36.5, 118, 38, 60, 38, 93.0,
 'Parenteral', 'IV', 'Serious', 'Hypotonic', 'Pale', TRUE, 'Open crib',
 NULL, TRUE, TRUE, 'Rewarming completed (72h hypothermia). Extubated to O2 hood. Tone slightly increased.'),

(2, '2025-11-19', '08:00:00', 'NICU',
 3160, 37.0, 125, 40, 62, 40, 95.0,
 'Parenteral', 'IV', 'Serious', 'Low', 'Pale', TRUE, 'Open crib',
 NULL, TRUE, TRUE, 'No supplemental O2. Enteral feeds started at 5ml/kg/h via OG tube. EEG borderline normal. MRI pending.'),

(2, '2025-11-20', '08:00:00', 'NICU',
 3150, 37.1, 130, 42, 64, 40, 96.0,
 'Mixed', 'OG + IV', 'Moderate', 'Low', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'Enteral 30ml/kg/day. Spontaneous alertness present. Weak sucking noted.'),

(2, '2025-11-22', '08:00:00', 'Intermediate',
 3140, 37.0, 132, 40, 65, 42, 96.5,
 'Enteral', 'OG', 'Moderate', 'Low', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'MRI: bilateral basal ganglia signal abnormality. Enteral 60ml/kg/day. Tone persists low.'),

(2, '2025-11-25', '08:00:00', 'Intermediate',
 3120, 37.0, 135, 38, 66, 42, 97.0,
 'Enteral', 'OG', 'Moderate', 'Low', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'Enteral 90ml/kg/day. Improved sucking reflex. Motor rehabilitation started. More sustained alertness.'),

(2, '2025-11-28', '08:00:00', 'Intermediate',
 3180, 37.1, 136, 38, 67, 43, 97.5,
 'Enteral', 'OG + Breast', 'Moderate', 'Normal', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'Breastfeeding with support. Enteral 120ml/kg/day. Weight recovering.'),

(2, '2025-12-02', '08:00:00', 'Rooming-in',
 3350, 37.1, 138, 36, 68, 44, 98.0,
 'Enteral', 'Breast', 'Stable', 'Normal', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'Discharge planned. Exclusive breastfeeding. Neurology follow-up scheduled. Family educated on warning signs.');

-- P3 — Severe hyperbilirubinemia + ABO incompatibility (40w, 3680g)
INSERT INTO neonatal_controls (
    patient_id, control_date, control_time, care_level,
    weight_g, temperature, heart_rate, respiratory_rate,
    bp_systolic, bp_diastolic, oxygen_saturation,
    feeding_type, feeding_route, general_condition,
    muscle_tone, skin_condition, oxygen_support, bed_type,
    incubator_temperature, position_changed, morning_hygiene, observations
) 
VALUES
(3, '2025-12-01', '12:00:00', 'Observation',
 3680, 37.0, 148, 44, 70, 45, 98.0,
 'Enteral', 'Breast', 'Good', 'Normal', 'Normal', FALSE, 'Open crib',
 NULL, FALSE, FALSE, 'Vigorous newborn. Blood group O Rh+, mother A Rh+. Direct Coombs positive. Monitoring for jaundice.'),

(3, '2025-12-02', '08:00:00', 'Observation',
 3590, 37.1, 150, 42, 70, 44, 97.5,
 'Enteral', 'Breast', 'Good', 'Normal', 'Icteric (face + chest)', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'Total bilirubin 14.2 mg/dL at 18h of life. Single phototherapy started. Breastfeeding every 2 hours.'),

(3, '2025-12-02', '20:00:00', 'Intermediate',
 3570, 37.2, 155, 44, 69, 44, 97.0,
 'Enteral', 'Breast + Cup', 'Moderate', 'Normal', 'Icteric (trunk)', TRUE, 'Open crib',
 NULL, TRUE, FALSE, 'TB 19.8 mg/dL at 26h. Intensive double phototherapy. Oral hydration supplement added.'),

(3, '2025-12-03', '06:00:00', 'Intermediate',
 3530, 37.0, 158, 44, 68, 43, 97.0,
 'Enteral', 'Breast + Cup', 'Moderate', 'Slightly low', 'Icteric (all body)', TRUE, 'Open crib',
 NULL, TRUE, TRUE, 'TB 25.1 mg/dL at 36h. Exchange transfusion indicated. Umbilical venous catheter placed.'),

(3, '2025-12-03', '14:00:00', 'NICU',
 3520, 37.0, 152, 42, 68, 44, 97.5,
 'Parenteral', 'IV', 'Serious', 'Normal', 'Icteric', FALSE, 'Open crib',
 NULL, TRUE, FALSE, 'Double-volume exchange transfusion completed. TB post-ET 12.3 mg/dL. No complications. Phototherapy continues.'),

(3, '2025-12-04', '08:00:00', 'Intermediate',
 3510, 37.1, 148, 40, 70, 44, 98.0,
 'Enteral', 'Breast', 'Good', 'Normal', 'Icteric (mild)', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'TB 9.8 mg/dL. Phototherapy paused for feeds. Breastfeeding well.'),

(3, '2025-12-05', '08:00:00', 'Observation',
 3520, 37.0, 145, 40, 71, 45, 98.5,
 'Enteral', 'Breast', 'Good', 'Normal', 'Slightly icteric', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'TB 7.2 mg/dL. Phototherapy discontinued. Good latch. Normal urine and stools.'),

(3, '2025-12-06', '08:00:00', 'Rooming-in',
 3540, 37.0, 144, 38, 71, 44, 98.5,
 'Enteral', 'Breast', 'Good', 'Normal', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'TB 5.1 mg/dL. Jaundice resolving. Hematocrit 38%. Discharge planned for next morning if stable.'),

(3, '2025-12-07', '08:00:00', 'Rooming-in',
 3560, 36.9, 142, 38, 70, 44, 99.0,
 'Enteral', 'Breast', 'Good', 'Normal', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, TRUE, 'Family educated on warning signs. Outpatient follow-up in 48h scheduled.'),

(3, '2025-12-07', '16:00:00', 'Discharge',
 3570, 37.0, 140, 36, 70, 44, 99.0,
 'Enteral', 'Breast', 'Good', 'Normal', 'Normal', FALSE, 'Open crib',
 NULL, TRUE, FALSE, 'Discharged home. TB 4.8. Weight above nadir. Jaundice outpatient clinic in 48h.');




-- ============================================================
-- DIAGNOSES
-- ============================================================
INSERT INTO neonatal_diagnoses (
    patient_id,
    diagnosis_name,
    icd10_code,
    diagnosis_date,
    status,
    priority,
    observations
)
VALUES

-- ============================================================
-- PATIENT 1
-- ============================================================

(1, 'Extremely Preterm Appropriate for Gestational Age (AGA)', NULL, '2025-10-03', 'Active', 1, 'Gestational age 26 weeks. Birth weight appropriate for gestational age.'),
(1, 'Extreme Prematurity', 'P07.22', '2025-10-03', 'Active', 2, 'Gestational age confirmed by physical examination and prenatal ultrasound.'),
(1, 'Respiratory Distress Syndrome', 'P22.0', '2025-10-03', 'Resolved', 3, 'Required intubation and surfactant. Extubated to CPAP on day 9.'),
(1, 'Intraventricular Hemorrhage Grade II', 'P52.1', '2025-10-03', 'Active', 4, 'Diagnosed on cranial ultrasound. Weekly imaging follow-up.'),
(1, 'Neonatal Sepsis', 'P36.8','2025-10-05', 'Resolved', 5, 'Blood culture positive for coagulase-negative Staphylococcus.'),
(1, 'Anemia of Prematurity','P61.2', '2025-10-08',  'Active', 6, 'Required one packed red blood cell transfusion.'),
(1, 'Apnea of Prematurity', 'P28.4', '2025-10-16', 'Active', 7, 'Receiving caffeine therapy.'),

-- ============================================================
-- PATIENT 2
-- ============================================================

(2, 'Term Appropriate for Gestational Age (AGA)', NULL, '2025-11-15', 'Active', 1, 'Term newborn with appropriate birth weight.'),
(2, 'Severe Birth Asphyxia', 'P21.0', '2025-11-15', 'Active', 2, 'Apgar 3 at 1 minute and 6 at 5 minutes.'),
(2, 'Moderate Hypoxic-Ischemic Encephalopathy', 'P91.62', '2025-11-15', 'Active', 3, 'Sarnat stage II. Therapeutic hypothermia completed.'),
(2, 'Neonatal Seizures', 'P90', '2025-11-15', 'Active', 4, 'Controlled with phenobarbital.'),
(2, 'Acute Kidney Injury', 'P96.0', '2025-11-16', 'Resolved', 5, 'Renal function normalized after hydration.'),
(2, 'Neonatal Hypoglycemia', 'P70.4', '2025-11-16', 'Resolved', 6, 'Corrected with intravenous dextrose.'),

-- ============================================================
-- PATIENT 3
-- ============================================================

(3, 'Term Appropriate for Gestational Age (AGA)', NULL, '2025-12-02', 'Active', 1, 'Term newborn with appropriate birth weight.'),
(3, 'Neonatal Jaundice due to ABO Incompatibility', 'P55.1', '2025-12-02', 'Resolved', 2, 'Direct Coombs positive.'),
(3, 'Severe Neonatal Hyperbilirubinemia', 'P59.9', '2025-12-03', 'Resolved', 3, 'Required exchange transfusion.');

-- ============================================================
-- MEDICATIONS
-- ============================================================
INSERT INTO neonatal_medications (patient_id, medication_name, dose, route, frequency, start_date, end_date, observations) VALUES
-- P1
(1, 'Surfactant (Poractant alfa)', '100 mg/kg', 'Intratracheal', 'Single dose', '2024-10-03', '2024-10-03', 'Administered at birth. Good clinical response.'),
(1, 'Ampicillin', '50 mg/kg', 'IV', 'Every 12h', '2024-10-05', '2024-10-15', 'Treatment for CoNS sepsis.'),
(1, 'Gentamicin', '4 mg/kg', 'IV', 'Every 36h', '2024-10-05', '2024-10-15', 'Drug level monitored at day 3. Nephrotoxicity surveillance.'),
(1, 'Caffeine citrate', '20 mg/kg load; 5 mg/kg/day', 'IV/PO', 'Daily', '2024-10-16', NULL, 'Apnea of prematurity. Continue until 34 weeks corrected gestational age.'),
(1, 'Vitamin D3', '400 IU', 'PO', 'Daily', '2024-10-16', NULL, 'Standard premature infant supplementation.'),
(1, 'Iron sulfate', '2 mg/kg/day', 'PO', 'Daily', '2024-11-03', NULL, 'Started at 4 weeks of life. Anemia prevention.'),

-- P2
(2, 'Phenobarbital', '20 mg/kg', 'IV', 'Loading dose', '2024-11-15', '2024-11-15', 'Seizure control — tonic episode.'),
(2, 'Phenobarbital', '5 mg/kg/day', 'PO', 'Daily', '2024-11-16', NULL, 'Anticonvulsant maintenance. EEG follow-up required.'),
(2, 'Dextrose 10%', '6 mg/kg/min GIR', 'IV', 'Continuous', '2024-11-15', '2024-11-20', 'Glycemic support during HIE management.'),

-- P3
(3, 'Phototherapy (double)', 'Standard protocol', 'External', 'Continuous 48h', '2024-12-02', '2024-12-05', 'Intensive double phototherapy for severe hyperbilirubinemia.'),
(3, 'Immunoglobulin IV (IVIG)', '0.5 g/kg', 'IV', 'Single dose', '2024-12-03', '2024-12-03', 'Administered prior to exchange transfusion for severe ABO incompatibility.'),



-- ============================================================
-- VACCINES
-- ============================================================
INSERT INTO neonatal_vaccines (patient_id, vaccine_name, administration_date, dose, batch_number, administration_site, observations) VALUES
(1, 'Hepatitis B', '2024-10-03', '10 mcg (0.5 mL)', 'HB-2024-001', 'Anterolateral thigh (right)', 'Administered at birth regardless of gestational age.'),
(1, 'Pneumococcal conjugate (PCV13)', '2024-12-03', '0.5 mL', 'PCV-2024-055', 'Anterolateral thigh (left)', 'Corrected age 8 weeks. First dose.'),
(2, 'Hepatitis B', '2024-11-15', '10 mcg (0.5 mL)', 'HB-2024-088', 'Anterolateral thigh (right)', 'Administered at birth.'),
(3, 'Hepatitis B', '2024-12-01', '10 mcg (0.5 mL)', 'HB-2024-092', 'Anterolateral thigh (right)', 'At birth. No adverse reactions.'),
(3, 'BCG', '2024-12-07', '0.05 mL', 'BCG-2024-030', 'Left deltoid (intradermal)', 'At discharge. Correct technique confirmed.'),

-- ============================================================
-- LABORATORY RESULTS
-- ============================================================
INSERT INTO neonatal_labs (patient_id, test_date, test_name, result, unit, reference_range, observations) VALUES
-- P1
(1, '2024-10-03', 'Hemoglobin', '14.2', 'g/dL', '14.0-20.0', 'At birth. Normal for gestational age.'),
(1, '2024-10-03', 'Hematocrit', '42', '%', '42-65', 'Normal at birth.'),
(1, '2024-10-03', 'Platelet count', '98000', '/uL', '150000-400000', 'Mild thrombocytopenia. Monitor closely.'),
(1, '2024-10-03', 'C-reactive protein (CRP)', '18.4', 'mg/L', '<10', 'Elevated. Sepsis suspected.'),
(1, '2024-10-03', 'Blood glucose', '38', 'mg/dL', '45-125', 'Mild hypoglycemia at birth. Corrected with IV dextrose.'),
(1, '2024-10-05', 'Blood culture', 'Positive — CoNS', '', 'Negative', 'Coagulase-negative Staphylococcus. Antibiotics started.'),
(1, '2024-10-08', 'Hematocrit', '28', '%', '35-55', 'Anemia. Transfusion indicated.'),
(1, '2024-10-08', 'Reticulocyte count', '4.8', '%', '2.0-6.0', 'Active erythropoiesis.'),
(1, '2024-10-15', 'C-reactive protein (CRP)', '3.2', 'mg/L', '<10', 'Normalized. Antibiotics discontinued.'),
(1, '2024-11-03', 'Hematocrit', '32', '%', '35-55', 'Mild anemia. No new transfusion required.'),

-- P2
(2, '2024-11-15', 'Umbilical cord pH', '6.98', '', '>=7.20', 'Severe acidosis. Confirms perinatal asphyxia.'),
(2, '2024-11-15', 'Base excess (BE)', '-14', 'mmol/L', '-2 to +2', 'Severe base deficit.'),
(2, '2024-11-15', 'Blood glucose', '32', 'mg/dL', '45-125', 'Hypoglycemia. IV dextrose started.'),
(2, '2024-11-15', 'Creatinine', '1.8', 'mg/dL', '0.2-1.0', 'Acute kidney injury. Close monitoring.'),
(2, '2024-11-16', 'Creatinine', '1.4', 'mg/dL', '0.2-1.0', 'Improving with hydration.'),
(2, '2024-11-17', 'Creatinine', '0.9', 'mg/dL', '0.2-1.0', 'Normalized.'),
(2, '2024-11-15', 'ALT (SGPT)', '68', 'U/L', '7-45', 'Mild hepatic elevation secondary to asphyxia.'),
(2, '2024-11-15', 'Lactate', '9.8', 'mmol/L', '<2.0', 'Severe hyperlactatemia. Consistent with asphyxia.'),
(2, '2024-11-16', 'EEG report', 'Burst suppression pattern', '', 'Normal', 'Burst suppression pattern. Poor initial prognosis indicator.'),
(2, '2024-11-22', 'MRI brain report', 'Bilateral basal ganglia signal abnormality', '', 'Normal', 'MRI: bilateral basal ganglia signal changes consistent with moderate-severe HIE.'),

-- P3
(3, '2024-12-01', 'Direct Coombs test', 'Positive (3+)', '', 'Negative', 'ABO incompatibility confirmed.'),
(3, '2024-12-01', 'Blood group (newborn)', 'O Rh+', '', '', 'Mother: A Rh+.'),
(3, '2024-12-02', 'Total bilirubin', '14.2', 'mg/dL', '<12 at 18h', 'Phototherapy started.'),
(3, '2024-12-02', 'Indirect bilirubin', '13.5', 'mg/dL', '<12', 'Predominantly indirect.'),
(3, '2024-12-02', 'Total bilirubin', '19.8', 'mg/dL', '<15 at 26h', 'Rapid rise. Intensive double phototherapy.'),
(3, '2024-12-03', 'Total bilirubin', '25.1', 'mg/dL', '<18 at 36h', 'Exchange transfusion threshold exceeded.'),
(3, '2024-12-03', 'Total bilirubin post-ET', '12.3', 'mg/dL', '<18', 'Post-exchange transfusion. Good response.'),
(3, '2024-12-05', 'Total bilirubin', '7.2', 'mg/dL', '<12', 'Decreasing. Phototherapy stopped.'),
(3, '2024-12-07', 'Total bilirubin', '4.8', 'mg/dL', '<12', 'Normal. Discharged.'),
(3, '2024-12-03', 'Hematocrit post-ET', '38', '%', '42-65', 'Mild drop post-exchange transfusion. Monitoring.'),

