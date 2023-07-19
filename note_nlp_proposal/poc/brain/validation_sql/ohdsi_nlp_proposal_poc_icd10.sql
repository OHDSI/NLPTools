SELECT  c3.concept_name           AS condition_type_concept_name
      , count(*)                  AS total
FROM condition_occurrence  JOIN concept c3 ON condition_occurrence.condition_type_concept_id = c3.concept_id
WHERE condition_concept_id IN(
SELECT descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id IN(
  SELECT c2.concept_id
  FROM concept c1 JOIN concept_relationship cr1 ON cr1.concept_id_1 = c1.concept_id AND cr1.relationship_id = 'Maps to'
                  JOIN concept c2 ON  cr1.concept_id_2 = c2.concept_id
  WHERE c1.concept_code IN(
    'C70'
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
  )
)
)
GROUP BY c3.concept_name