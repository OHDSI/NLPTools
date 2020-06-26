# Introduction

This repository stores multiple projects developed by OHDSI NLP Working Group to provide various NLP tools and functionalities to medical data stored in OMOP Common Data Model based databases.

## Wrappers

The Wrappers section contains three separate Java projects allowing medical data stored in OMOP Common Data Model based databases to be indexed by CLAMP, MetaMap Lite, or Apache cTAKES. Each project also includes example input texts and their corresponding outputs. Installation and set-up instructions, including how to obtain necessary NLP resources to run these projects are explained in the documentation under [Wrappers directory](/Wrappers).

## THEIA

THEIA is multi-component software aiming to make it easier and more convenient to use certain NLP toolkits with OHDSI. The main purpose of this application is to allow clients to process their medical texts stored in their OMOP Common Data Model formatted databases and give them the ability to query and visualize their results. Clients can share their information and queries with each other with support from an integrated user access control system. THEIA is currently in development, and supports indexing medical texts with CLAMP, MetaMap Lite, and cTAKES NLP toolkits. Currently, it is downloadable as a Docker container, which comes with all components necessary to set up and run THEIA. Installation and set-up instructions, including how to obtain the THEIA Docker container are provided in the documentation under [THEIA directory](/THEIA).

## COVID-19 TestNorm

COVID-19 TestNorm a simple but effective rule-based tool to automatically normalize local COVID-19 testing names to standard LOINC codes. This tool was developed and evaluated using 568 test names collected from eight healthcare systems, and is available as an 
open-source package for developers at [COVID-19 TestNorm Github repository](https://github.com/UTHealth-CCB/covid19_testnorm) and as an online web application for end-users at [COVID-19 TestNorm webpage](https://clamp.uth.edu/covid/loinc).

## Ananke

OHDSI Ananke is a tool for mapping between OHDSI Concept Identifiers to Unified Medical Language System (UMLS) identifiers, available at [OHDSIananke repository](https://github.com/thepanacealab/OHDSIananke).

## OMOP Abstractor

OMOP Abstractor is an NLP-aided assisted chart abstraction platform built upon the OMOP CDM from OHDSI.org, available at [omop-abstractor repository](https://github.com/NUARIG/omop-abstractor).

## COVID19NLP.org

[COVID19NLP.org](http://covid19nlp.org/) is a website dedicated to collecting and sharing available NLP resources for COVID-19, including publications, datasets, tools, vocabularies, and events. The ultimate goal for this website is to promote re-use of existing NLP resources to facilitate COVID-19 research. This website is a community effort with volunteers who are working on different aspects of biomedical NLP and COVID-19 research.


