# Introduction

This repository stores multiple projects developed by UTHealth to provide various NLP tools and functionalities to medical data stored in OMOP Common Data Model based databases.

## Wrappers

The Wrappers section contains three separate Java projects allowing medical data stored in OMOP Common Data Model based databases to be indexed by CLAMP, MetaMap Lite, or Apache cTAKES. Each project also includes example input texts and their corresponding outputs. Installation and set-up instructions, including how to obtain necessary NLP resources to run these projects are explained in the documentation under [Wrappers directory](/Wrappers).

## THEIA

THEIA is multi-component software aiming to make it easier and more convenient to use certain NLP toolkits with OHDSI. The main purpose of this application is to allow clients to process their medical texts stored in their OMOP Common Data Model formatted databases and give them the ability to query and visualize their results. Clients can share their information and queries with each other with support from an integrated user access control system. THEIA is currently in development, and supports indexing medical texts with CLAMP, MetaMap Lite, and cTAKES NLP toolkits. Currently, it is downloadable as a Docker container, which comes with all components necessary to set up and run THEIA. Installation and set-up instructions, including how to obtain the THEIA Docker container are provided in the documentation under [THEIA directory](/THEIA).

