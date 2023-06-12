SELECT 'prostate cancer'                                                           AS cohort
     , 'site'                                                                      AS target_variable
     , c.vocabulary_id                                                             AS source_vocabulary_id
     , c.concept_name                                                              AS source_concept_name
     , c.concept_code                                                              AS source_concept_code
     , c.domain_id                                                                 AS omop_domain_id
     , c.vocabulary_id                                                             AS omop_vocabulary_id
     , c.concept_name                                                              AS omop_concept_name
     , c.concept_code                                                              AS omop_concept_code
     , c.concept_id                                                                AS omop_concept_id
     , 1                                                                           AS sequence
     ,'pre-coordinated with histology concept code and look up in Condition domain'  AS instructions
FROM concept c
WHERE c.vocabulary_id = 'ICDO3'
AND c.concept_code IN(
  'C61.9'
)
UNION
SELECT 'prostate cancer'                                                           AS cohort
     , 'histology'                                                                 AS target_variable
     , c.vocabulary_id                                                             AS source_vocabulary_id
     , c.concept_name                                                              AS source_concept_name
     , c.concept_code                                                              AS source_concept_code
     , c.domain_id                                                                 AS omop_domain_id
     , c.vocabulary_id                                                             AS omop_vocabulary_id
     , c.concept_name                                                              AS omop_concept_name
     , c.concept_code                                                              AS omop_concept_code
     , c.concept_id                                                                AS omop_concept_id
     , 2                                                                           AS sequence
     ,'pre-coordinate with histology concept code and look up in Condition domain'  AS instructions
FROM concept c
WHERE c.vocabulary_id = 'ICDO3'
AND c.concept_code IN(
  '8140/3'
, '8500/3'
, '8041/3'
)
UNION
SELECT 'prostate cancer'         AS cohort
      , 'pT Category'            AS target_variable
      , c1.vocabulary_id         AS source_vocabulary_id
      , c1.concept_name          AS source_concept_name
      , c1.concept_code          AS source_concept_code
      , c1.domain_id             AS omop_domain_id
      , c1.vocabulary_id         AS omop_vocabulary_id
      , c1.concept_name          AS omop_concept_name
      , c1.concept_code          AS omop_concept_code
      , c1.concept_id            AS omop_concept_id
      , 3                        AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'Cancer Modifier'
AND c1.concept_code IN(
--7th
  'p-7th_AJCC/UICC-T2'
, 'p-7th_AJCC/UICC-T2a'
, 'p-7th_AJCC/UICC-T2b'
, 'p-7th_AJCC/UICC-T2c'
, 'p-7th_AJCC/UICC-T3'
, 'p-7th_AJCC/UICC-T3a'
, 'p-7th_AJCC/UICC-T3b'
, 'p-7th_AJCC/UICC-T4'
--8th
, 'p-8th_AJCC/UICC-T2'
, 'p-8th_AJCC/UICC-T3'
, 'p-8th_AJCC/UICC-T3a'
, 'p-8th_AJCC/UICC-T3b'
, 'p-8th_AJCC/UICC-T4'
)
UNION
SELECT 'prostate cancer'         AS cohort
      , 'pN Category'            AS target_variable
      , c1.vocabulary_id         AS source_vocabulary_id
      , c1.concept_name          AS source_concept_name
      , c1.concept_code          AS source_concept_code
      , c1.domain_id             AS omop_domain_id
      , c1.vocabulary_id         AS omop_vocabulary_id
      , c1.concept_name          AS omop_concept_name
      , c1.concept_code          AS omop_concept_code
      , c1.concept_id            AS omop_concept_id
      , 4                        AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'Cancer Modifier'
AND c1.concept_code IN(
--7th
  'p-7th_AJCC/UICC-NX'
, 'p-7th_AJCC/UICC-N0'
, 'p-7th_AJCC/UICC-N1'
--8th
, 'p-8th_AJCC/UICC-NX'
, 'p-8th_AJCC/UICC-N0'
, 'p-8th_AJCC/UICC-N1'
)
UNION
SELECT 'prostate cancer'         AS cohort
      , 'pM Category'            AS target_variable
      , c1.vocabulary_id         AS source_vocabulary_id
      , c1.concept_name          AS source_concept_name
      , c1.concept_code          AS source_concept_code
      , c1.domain_id             AS omop_domain_id
      , c1.vocabulary_id         AS omop_vocabulary_id
      , c1.concept_name          AS omop_concept_name
      , c1.concept_code          AS omop_concept_code
      , c1.concept_id            AS omop_concept_id
      , 5                        AS sequence
      ,'modify parent entry in condition occurrence from precoordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'Cancer Modifier'
AND c1.concept_code IN(
--7th
  'p-7th_AJCC/UICC-M0'
, 'p-7th_AJCC/UICC-M1'
, 'p-7th_AJCC/UICC-M1a'
, 'p-7th_AJCC/UICC-M1b'
, 'p-7th_AJCC/UICC-M1c'
--8th
, 'p-8th_AJCC/UICC-M1'
, 'p-8th_AJCC/UICC-M1a'
, 'p-8th_AJCC/UICC-M1b'
, 'p-8th_AJCC/UICC-M1c'
)
UNION
SELECT 'prostate cancer'         AS cohort
      , 'histologic grade'       AS target_variable
      , c1.vocabulary_id         AS source_vocabulary_id
      , c1.concept_name          AS source_concept_name
      , c1.concept_code          AS source_concept_code
      , c2.domain_id             AS omop_domain_id
      , c2.vocabulary_id         AS omop_vocabulary_id
      , c2.concept_name          AS omop_concept_name
      , c2.concept_code          AS omop_concept_code
      , c2.concept_id            AS omop_concept_id
      , 6                        AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1 JOIN concept_relationship cr1 ON c1.concept_id = cr1.concept_id_1 AND c1.vocabulary_id = 'NAACCR' AND cr1.relationship_id = 'Maps to'
                JOIN concept c2               ON cr1.concept_id_2 = c2.concept_id
WHERE c1.concept_name IN(
 'Primary pattern 1, secondary pattern 1'
,'Primary pattern 1, secondary pattern 2'
,'Primary pattern 1, secondary pattern 3'
,'Primary pattern 1, secondary pattern 4'
,'Primary pattern 1, secondary pattern 5'
,'Primary pattern 1, secondary pattern unknown'
,'Primary pattern 2, secondary pattern 1'
,'Primary pattern 2, secondary pattern 2'
,'Primary pattern 2, secondary pattern 3'
,'Primary pattern 2, secondary pattern 4'
,'Primary pattern 2, secondary pattern 5'
,'Primary pattern 2, secondary pattern unknown'
,'Primary pattern 3, secondary pattern 1'
,'Primary pattern 3, secondary pattern 2'
,'Primary pattern 3, secondary pattern 3'
,'Primary pattern 3, secondary pattern 4'
,'Primary pattern 3, secondary pattern 5'
,'Primary pattern 3, secondary pattern unknown'
,'Primary pattern 4, secondary pattern 1'
,'Primary pattern 4, secondary pattern 2'
,'Primary pattern 4, secondary pattern 3'
,'Primary pattern 4, secondary pattern 4'
,'Primary pattern 4, secondary pattern 5'
,'Primary pattern 4, secondary pattern unknown'
,'Primary pattern 5, secondary pattern 1'
,'Primary pattern 5, secondary pattern 2'
,'Primary pattern 5, secondary pattern 3'
,'Primary pattern 5, secondary pattern 4'
,'Primary pattern 5, secondary pattern 5'
,'Primary pattern 5, secondary pattern unknown'
,'Primary pattern unknown, secondary pattern unknown'
)
AND c1.concept_code like '%3839@%'
ORDER BY cohort, sequence, omop_concept_code