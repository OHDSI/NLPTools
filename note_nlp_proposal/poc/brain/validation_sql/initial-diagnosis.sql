DROP TABLE IF EXISTS nlp_diagnoses;
CREATE TABLE nlp_diagnoses(
  cancer_type                       varchar(255) NULL,
  condition_occurrence_id           BIGINT,
  condition_concept_id              BIGINT,
  person_id                         BIGINT,
  condition_start_date              date NULL,
  histology                         varchar(255) NULL,
  site                              varchar(255) NULL,
  histology_site                    varchar(255) NULL,
  initial_diagnosis                 boolean NULL
);

INSERT INTO nlp_diagnoses
(
  condition_occurrence_id
, condition_concept_id
, person_id
, condition_start_date
, initial_diagnosis
)
SELECT          condition_occurrence.condition_occurrence_id
              , condition_occurrence.condition_concept_id
              , condition_occurrence.person_id
              , condition_occurrence.condition_start_date
              , CASE WHEN measurement.measurement_id IS NOT NULL THEN true ELSE false END AS initial_diagnosis
FROM condition_occurrence LEFT JOIN measurement ON condition_occurrence.condition_occurrence_id = measurement.measurement_event_id AND measurement.meas_event_field_concept_id = 1147127 AND measurement.measurement_concept_id = 734306 --Initial Diagnosis
WHERE condition_occurrence.condition_type_concept_id = 32858; --NLP

UPDATE nlp_diagnoses
SET   histology_site = c1.concept_code
    , histology      = c2.concept_code
FROM concept_relationship cr1 JOIN concept c1 ON cr1.concept_id_2 = c1.concept_id AND c1.vocabulary_id = 'ICDO3'
                              JOIN concept_relationship cr2 ON c1.concept_id = cr2.concept_id_1 AND cr2.relationship_id = 'Has Histology ICDO'
                              JOIN concept c2 ON cr2.concept_id_2 = c2.concept_id
WHERE nlp_diagnoses.condition_concept_id = cr1.concept_id_1
AND cr1.relationship_id = 'Mapped from';


UPDATE nlp_diagnoses
SET   histology_site = c1.concept_code
    , site           = c2.concept_code
FROM concept_relationship cr1 JOIN concept c1 ON cr1.concept_id_2 = c1.concept_id AND c1.vocabulary_id = 'ICDO3'
                              JOIN concept_relationship cr2 ON c1.concept_id = cr2.concept_id_1 AND cr2.relationship_id = 'Has Topography ICDO'
                              JOIN concept c2 ON cr2.concept_id_2 = c2.concept_id
WHERE nlp_diagnoses.condition_concept_id = cr1.concept_id_1
AND cr1.relationship_id = 'Mapped from' ;

UPDATE nlp_diagnoses
SET cancer_type = 'Brain'
WHERE site IN(
 'C41.0'
,'C41.1'
,'C70.0'
,'C70.1'
,'C70.9'
,'C71.0'
,'C71.1'
,'C71.2'
,'C71.3'
,'C71.4'
,'C71.5'
,'C71.6'
,'C71.7'
,'C71.8'
,'C71.9'
,'C72.0'
,'C72.1'
,'C72.2'
,'C72.3'
,'C72.4'
,'C72.5'
,'C72.8'
,'C72.9'
,'C75.1'
,'C75.2'
,'C75.3'
);

DROP TABLE IF EXISTS brain_concepts;
CREATE TABLE brain_concepts(
  concept_id                    BIGINT
);

INSERT INTO brain_concepts
(
  concept_id
)
SELECT ca.descendant_concept_id
FROM concept c1 JOIN concept_relationship cr1 ON c1.concept_id = cr1.concept_id_1 AND cr1.relationship_id = 'Maps to'
                JOIN concept_ancestor ca ON  cr1.concept_id_2 = ca.ancestor_concept_id
WHERE c1.vocabulary_id IN('ICD10CM')
AND c1.concept_code IN(
--ICD10CM
 'C41.0'
,'C41.1'
,'C70'
,'C70.0'
,'C70.1'
,'C70.9'
,'C71'
,'C71.0'
,'C71.1'
,'C71.2'
,'C71.3'
,'C71.4'
,'C71.5'
,'C71.6'
,'C71.7'
,'C71.8'
,'C71.9'
,'C72'
,'C72.0'
,'C72.1'
,'C72.2'
,'C72.20'
,'C72.21'
,'C72.22'
,'C72.3'
,'C72.30'
,'C72.31'
,'C72.32'
,'C72.4'
,'C72.40'
,'C72.41'
,'C72.42'
,'C72.5'
,'C72.50'
,'C72.59'
,'C72.9'
,'C75.1'
,'C75.2'
,'C75.3'
);

DROP TABLE IF EXISTS brain_clinical_diagnoses;
CREATE TABLE brain_clinical_diagnoses(
  person_id                     BIGINT,
  diagnosis_start_date          date
);

INSERT INTO brain_clinical_diagnoses
(
    person_id
 , diagnosis_start_date
)
SELECT  condition_occurrence.person_id
      , MIN(condition_occurrence.condition_start_date)    AS diagnosis_start_date
FROM condition_occurrence JOIN brain_concepts ON condition_occurrence.condition_concept_id = brain_concepts.concept_id
WHERE condition_occurrence.condition_type_concept_id != 32858 --NLP
GROUP BY condition_occurrence.person_id;

DROP TABLE IF EXISTS patients;

CREATE TABLE patients(
  cancer_type                                                   varchar(255)  NULL,
  person_id                                                     BIGINT        NULL,
  -- deidentified_person_id                                        BIGINT        NULL,
  condition_occurrence_id                                       BIGINT        NULL,
  nlp_diagnosis_date_minus_ehr_diagnosis_date                   BIGINT        NULL,
  nlp_diagnosis_date                                            date          NULL,
  nlp_diagnosis_initial_diagnosis                               boolean       NULL,
  ehr_diagnosis_date                                            date          NULL,
  second_ehr_diagnosis_date                                     date          NULL,
  second_ehr_diagnosis_date_minus_first_ehr_diagnosis_date      BIGINT        NULL

);

INSERT INTO patients
(
   cancer_type
,  person_id
-- ,  deidentified_person_id
,  condition_occurrence_id
,  nlp_diagnosis_date
,  nlp_diagnosis_initial_diagnosis
,  ehr_diagnosis_date
,  nlp_diagnosis_date_minus_ehr_diagnosis_date
)
SELECT  nlp_diagnoses.cancer_type
      , nlp_diagnoses.person_id
      -- , row_number() over(ORDER BY nlp_diagnoses.person_id desc) as deidentified_person_id
      , nlp_diagnoses.condition_occurrence_id
      , nlp_diagnoses.condition_start_date AS nlp_diagnosis_date
      , nlp_diagnoses.initial_diagnosis    AS nlp_diagnosis_initial_diagnosis
      , brain_clinical_diagnoses.diagnosis_start_date AS ehr_diagnosis_date
      , nlp_diagnoses.condition_start_date - brain_clinical_diagnoses.diagnosis_start_date AS days
FROM  nlp_diagnoses LEFT JOIN brain_clinical_diagnoses ON nlp_diagnoses.person_id = brain_clinical_diagnoses.person_id
WHERE nlp_diagnoses.cancer_type = 'Brain';

DROP TABLE IF EXISTS first_brain_clinical_diagnoses;
CREATE TABLE first_brain_clinical_diagnoses(
  person_id                     BIGINT,
  diagnosis_start_date          date,
  rn                            BIGINT
);

INSERT INTO first_brain_clinical_diagnoses
(
    person_id
  , diagnosis_start_date
  , rn

)
SELECT  person_id
      , condition_start_date
      , rn
FROM(
SELECT  person_id
      , row_number() over(partition by data.person_id ORDER BY data.condition_start_date ASC) AS rn
      , condition_start_date
FROM(
SELECT DISTINCT condition_occurrence.person_id
              , condition_occurrence.condition_start_date
FROM condition_occurrence JOIN brain_concepts ON condition_occurrence.condition_concept_id = brain_concepts.concept_id
WHERE condition_occurrence.condition_type_concept_id != 32858 --NLP
) data
) data2
WHERE data2.rn IN(1,2)
ORDER BY person_id, rn;

UPDATE patients
SET second_ehr_diagnosis_date = first_brain_clinical_diagnoses.diagnosis_start_date
FROM first_brain_clinical_diagnoses
WHERE first_brain_clinical_diagnoses.person_id = patients.person_id
AND patients.cancer_type = 'Brain'
AND first_brain_clinical_diagnoses.rn = 2;


UPDATE patients
SET second_ehr_diagnosis_date_minus_first_ehr_diagnosis_date = second_ehr_diagnosis_date - ehr_diagnosis_date;

SELECT  person.person_source_value
      , data.*
FROM(
SELECT  *
      , row_number() over(ORDER BY patients.person_id desc) AS nlp_diagnosis_order
      , ROW_NUMBER() OVER (PARTITION BY patients.person_id  ORDER BY patients.nlp_diagnosis_date) AS row_number
FROM patients
) data JOIN person ON data.person_id = person.person_id
where data.row_number = 1
AND data.nlp_diagnosis_date_minus_ehr_diagnosis_date IS NOT NULL
AND data.nlp_diagnosis_initial_diagnosis = true
ORDER BY nlp_diagnosis_date_minus_ehr_diagnosis_date DESC