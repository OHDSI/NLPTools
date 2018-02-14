# ohdsi-nlp-wrapper

This repository contains three separate eclipse projects: clamp-wrapper, ctakes-wrapper, metamap-lite-wrapper; Users can import them into eclipse as existing prjects;

## download dependencies
To run the wrapper, users must download the dependent libraries and resources and then place them in the subfolder.
For example, This is a directory of ctakes wrapper:

ctakes-wrapper

--bin

--input

--output

--lib

----ctakes

------config

------desc

------lib

------resources

--resources

----org

--src


Here are download links

clamp wrapper resources:
https://drive.google.com/open?id=1uzvWZPebq3DYZNPFNm2Ise354IWuyADo

ctake wrapper resources:
https://drive.google.com/open?id=1qYqK5FZm5zJgTttCXxXd_Ufa0ffmKjAc

metamap lite wrapper resources:
https://drive.google.com/open?id=1sjUad3KYbBtI1iFz3iw_LW4fdtu4q1UZ

## set UMLS account
For cTAKES wrapper, edit this file:

./lib/ctakes/resources/org/apache/ctakes/dictionary/lookup/fast/cTakesHsql.xml

property key="umlsUser" value="YOUR_UMLS_USER_NAME"

property key="umlsPass" value="YOUR_UMLS_USER_PASSWORD"


For CLAMP wrapper, write them in the java code:

ClampWrapper clamp = new ClampWrapper( "resources/clamp/clamp-ner-attribute.pipeline", 

  "YOUR_UMLS_USER_NAME", 
  
  "YOUR_UMLS_USER_PASSWORD", 
  
  "resources/clamp/umls_index/", 
  
  "resources/clamp/rxnorm_index/" );
  

## set CLAMP SN

For CLAMP wrapper, users must obtain an SN code from CLAMP website and input their email and SN for the first time when they start CLAMP wrapper.

Please visit this page and submit an request for Clamp Command line version 1.4.0.

https://clamp.uth.edu/get-clamp.php


