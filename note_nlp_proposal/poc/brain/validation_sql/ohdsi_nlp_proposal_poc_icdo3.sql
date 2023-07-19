SELECT   c4.concept_name           AS condition_type_concept_name
       , count(*)                  AS total

FROM condition_occurrence JOIN concept c4 ON condition_occurrence.condition_type_concept_id = c4.concept_id
WHERE condition_concept_id IN(
SELECT descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id IN(
SELECT c3.concept_id
FROM concept c1 JOIN concept_relationship cr1 ON cr1.concept_id_1 = c1.concept_id AND cr1.relationship_id = 'Histology of ICDO'
                JOIN concept c2 ON  cr1.concept_id_2 = c2.concept_id
				JOIN concept_relationship cr2 ON cr2.concept_id_1 = c2.concept_id AND cr2.relationship_id = 'Maps to'
				JOIN concept c3 ON cr2.concept_id_2 = c3.concept_id
WHERE c1.concept_code IN(
 '9382/3'
,'9383/1'
,'9385/3'
,'9391/3'
,'9392/3'
,'9393/3'
,'9394/1'
,'9396/3'
,'9400/3'
,'9401/3'
,'9411/3'
,'9421/1'
,'9424/3'
,'9430/3'
,'9431/1'
,'9440/3'
,'9442/3'
,'9444/1'
,'9445/3'
,'9450/3'
,'9451/3'
)
)
)
GROUP BY c4.concept_name