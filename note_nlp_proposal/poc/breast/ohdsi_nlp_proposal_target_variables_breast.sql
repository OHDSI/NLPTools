SELECT 'breast cancer'                                                             AS cohort
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
     ,'pre-coordinate with histology concept code and look up in Condition domain'  AS instructions
FROM concept c
WHERE c.vocabulary_id = 'ICDO3'
AND c.concept_code IN(
  'C50.0'
, 'C50.1'
, 'C50.2'
, 'C50.3'
, 'C50.4'
, 'C50.5'
, 'C50.8'
, 'C50.9'
)
UNION
SELECT 'breast cancer'                                                             AS cohort
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
 '8500/2'
,'8540/3'
,'8504/2'
,'8509/2'
,'8500/3'
,'8520/3'
,'8522/3'
,'8211/3'
,'8201/3'
,'8480/3'
,'8507/3'
,'8401/3'
,'8575/3'
,'8404/3'
,'8509/3'
,'8503/3'
,'8200/3'
,'8240/3'
,'8246/3'
,'8315/3'
,'8490/3'
,'8502/3'
)
UNION
SELECT 'breast cancer'           AS cohort
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
  'p-7th_AJCC/UICC-TX'
, 'p-7th_AJCC/UICC-T0'
, 'p-7th_AJCC/UICC-Tis'
, 'p-7th_AJCC/UICC-Tis(DCIS)'
, 'p-7th_AJCC/UICC-Tis(LCIS)' --missing from Cancer Modifier vocabulary
, 'p-7th_AJCC/UICC-Tis(Paget)'
, 'p-7th_AJCC/UICC-T1'
, 'p-7th_AJCC/UICC-T1mi'
, 'p-7th_AJCC/UICC-T1a'
, 'p-7th_AJCC/UICC-T1b'
, 'p-7th_AJCC/UICC-T1c'
, 'p-7th_AJCC/UICC-T2'
, 'p-7th_AJCC/UICC-T3'
, 'p-7th_AJCC/UICC-T4'
--8th
, 'p-8th_AJCC/UICC-T0'
, 'p-8th_AJCC/UICC-Tis(DCIS)'
, 'p-8th_AJCC/UICC-Tis(Paget)'
, 'p-8th_AJCC/UICC-T1mi'
, 'p-8th_AJCC/UICC-T1a'
, 'p-8th_AJCC/UICC-T1b'
, 'p-8th_AJCC/UICC-T1c'
, 'p-8th_AJCC/UICC-T1'
, 'p-8th_AJCC/UICC-T2'
, 'p-8th_AJCC/UICC-T3'
, 'p-8th_AJCC/UICC-T4a'
, 'p-8th_AJCC/UICC-T4b'
, 'p-8th_AJCC/UICC-T4c'
, 'p-8th_AJCC/UICC-T4d'
, 'p-8th_AJCC/UICC-T4'
)

UNION
SELECT  'breast cancer'          AS cohort
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
, 'p-7th_AJCC/UICC-N0(i-)'     --missing from Cancer Modifier vocabulary
, 'p-7th_AJCC/UICC-N0(i+)'
, 'p-7th_AJCC/UICC-N0(mol-)'   --missing from Cancer Modifier vocabulary
, 'p-7th_AJCC/UICC-N0(mol+)'
, 'p-7th_AJCC/UICC-N1'
, 'p-7th_AJCC/UICC-N1mi'
, 'p-7th_AJCC/UICC-N1a'
, 'p-7th_AJCC/UICC-N1b'
, 'p-7th_AJCC/UICC-N1c'
, 'p-7th_AJCC/UICC-N2'
, 'p-7th_AJCC/UICC-N2a'
, 'p-7th_AJCC/UICC-N2b'
, 'p-7th_AJCC/UICC-N3'
, 'p-7th_AJCC/UICC-N3a'
, 'p-7th_AJCC/UICC-N3b'
, 'p-7th_AJCC/UICC-N3c'
--8th
, 'p-8th_AJCC/UICC-NX'
, 'p-8th_AJCC/UICC-N0'
, 'p-8th_AJCC/UICC-N0(i+)'
, 'p-8th_AJCC/UICC-N0(mol+)'
, 'p-8th_AJCC/UICC-N1mi'
, 'p-8th_AJCC/UICC-N1a'
, 'p-8th_AJCC/UICC-N1b'
, 'p-8th_AJCC/UICC-N1c'
, 'p-8th_AJCC/UICC-N2a'
, 'p-8th_AJCC/UICC-N2b'
, 'p-8th_AJCC/UICC-N3a'
, 'p-8th_AJCC/UICC-N3b'
, 'p-8th_AJCC/UICC-N3c'

)
UNION
SELECT 'breast cancer'           AS cohort
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
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'Cancer Modifier'
AND c1.concept_code IN(
--7th
  'p-7th_AJCC/UICC-M0'
, 'p-7th_AJCC/UICC-M0(i+)'
, 'p-7th_AJCC/UICC-M1'
--8th
, 'p-8th_AJCC/UICC-M0'
, 'p-8th_AJCC/UICC-M0(i+)'
, 'p-8th_AJCC/UICC-M1'
)
UNION
SELECT 'breast cancer'           AS cohort
      , 'Estrogen Receptor (ER) Status' AS target_variable
      , c1.vocabulary_id                AS source_vocabulary_id
      , c1.concept_name                 AS source_concept_name
      , c1.concept_code                 AS source_concept_code
      , c1.domain_id                    AS omop_domain_id
      , c1.vocabulary_id                AS omop_vocabulary_id
      , c1.concept_name                 AS omop_concept_name
      , c1.concept_code                 AS omop_concept_code
      , c1.concept_id                   AS omop_concept_id
      , 6                               AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'OMOP Genomic'
AND c1.concept_code IN(
'OMOP4997545'
)
UNION
SELECT 'breast cancer'           AS cohort
      , 'Progesterone Receptor (PgR) Status' AS target_variable
      , c1.vocabulary_id                AS source_vocabulary_id
      , c1.concept_name                 AS source_concept_name
      , c1.concept_code                 AS source_concept_code
      , c1.domain_id                    AS omop_domain_id
      , c1.vocabulary_id                AS omop_vocabulary_id
      , c1.concept_name                 AS omop_concept_name
      , c1.concept_code                 AS omop_concept_code
      , c1.concept_id                   AS omop_concept_id
      , 7                               AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'OMOP Genomic'
AND c1.concept_code IN(
'OMOP4997646'
)
UNION
SELECT 'breast cancer'           AS cohort
      , 'Progesterone Receptor (PgR) Status' AS target_variable
      , c1.vocabulary_id                AS source_vocabulary_id
      , c1.concept_name                 AS source_concept_name
      , c1.concept_code                 AS source_concept_code
      , c1.domain_id                    AS omop_domain_id
      , c1.vocabulary_id                AS omop_vocabulary_id
      , c1.concept_name                 AS omop_concept_name
      , c1.concept_code                 AS omop_concept_code
      , c1.concept_id                   AS omop_concept_id
      , 8                               AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1
WHERE c1.vocabulary_id = 'OMOP Genomic'
AND c1.concept_code IN(
'OMOP4997544'
)
ORDER BY cohort, sequence, omop_concept_code