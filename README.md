# ohdsi-nlp-wrapper

This repository contains three separate eclipse projects: clamp-wrapper, ctakes-wrapper, metamap-lite-wrapper; Users can import them into eclipse as existing projects.

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




### cTAKES wrapper setup

* Download the latest cTAKES binary file: http://apache.osuosl.org//ctakes/ctakes-4.0.0/apache-ctakes-4.0.0-bin.zip
* Unzip that file
* Run ```mkdir -p ctakes-wrapper/lib/ctakes```
* Copy lib directory into classpath: ```cp -r apache-ctakes-4.0.0/lib <ctakes-wrapper-location>/lib/ctakes/```
* Copy resource files into classpath: ```cp -r apache-ctakes-4.0.0/resources ctakes-wrapper/lib/ctakes/```
* Download the official cTAKES UMLS resources: https://downloads.sourceforge.net/project/ctakesresources/sno_rx_16ab.zip
* Unzip that file into the resources directory: ```unzip sno_rx_16ab.zip -d <ctakes-wrapper-location>/lib/ctakes/resources/org/apache/ctakes/dictionary/lookup/fast/```
* Setup your UMLS credentials in this file:
  ```<ctakes-wrapper-location>/lib/ctakes/resources/org/apache/ctakes/dictionary/lookup/fast/sno_rx_16ab.xml```
  * There are two places where you need to replace ```YOUR_UMLS_USER_NAME``` with your UMLS user name and ```YOUR_UMLS_USER_PASSWORD``` with your UMLS password.
* Now you should be able to run the class in the ctakes-wrapper project.

Here are download links

clamp wrapper resources:
https://drive.google.com/open?id=1uzvWZPebq3DYZNPFNm2Ise354IWuyADo

metamap lite wrapper resources:
https://drive.google.com/open?id=1sjUad3KYbBtI1iFz3iw_LW4fdtu4q1UZ

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


