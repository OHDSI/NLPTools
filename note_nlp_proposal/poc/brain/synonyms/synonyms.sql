SELECT  aov.vocabulary_code
      , aov.value            AS data_point_value
      , aovv.value           AS data_point_value_synonym
FROM abstractor_subjects asb JOIN abstractor_abstraction_schemas aas ON asb.abstractor_abstraction_schema_id = aas.id
                             JOIN abstractor_namespaces an ON asb.namespace_id = an.id AND asb.namespace_type = 'Abstractor::AbstractorNamespace'
                             LEFT JOIN abstractor_abstraction_schema_object_values aasov ON aas.id = aasov.abstractor_abstraction_schema_id
                             LEFT JOIN abstractor_object_values aov ON aasov.abstractor_object_value_id = aov.id
                             LEFT JOIN abstractor_object_value_variants aovv ON aov.id = aovv.abstractor_object_value_id
                             LEFT JOIN abstractor_subject_group_members asgm ON asb.id = asgm.abstractor_subject_id
                             LEFT JOIN abstractor_subject_groups asg ON asgm.abstractor_subject_group_id = asg.id
WHERE an.name = 'Surgical Pathology'
AND aas.predicate = 'has_cancer_site'
AND aov.vocabulary_code IN(
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
)

ORDER BY aov.vocabulary_code, aov.value, aovv.value



SELECT  aov.vocabulary_code
      , aov.value            AS data_point_value
      , aovv.value           AS data_point_value_synonym
FROM abstractor_subjects asb JOIN abstractor_abstraction_schemas aas ON asb.abstractor_abstraction_schema_id = aas.id
                             JOIN abstractor_namespaces an ON asb.namespace_id = an.id AND asb.namespace_type = 'Abstractor::AbstractorNamespace'
                             LEFT JOIN abstractor_abstraction_schema_object_values aasov ON aas.id = aasov.abstractor_abstraction_schema_id
                             LEFT JOIN abstractor_object_values aov ON aasov.abstractor_object_value_id = aov.id
                             LEFT JOIN abstractor_object_value_variants aovv ON aov.id = aovv.abstractor_object_value_id
                             LEFT JOIN abstractor_subject_group_members asgm ON asb.id = asgm.abstractor_subject_id
                             LEFT JOIN abstractor_subject_groups asg ON asgm.abstractor_subject_group_id = asg.id
WHERE an.name = 'Surgical Pathology'
AND aas.predicate = 'has_cancer_histology'
AND aov.vocabulary_code IN(
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
AND  aovv.value != '-glioblastoma'
ORDER BY aov.vocabulary_code, aov.value, aovv.value
