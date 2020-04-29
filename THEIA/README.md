# Introduction

This document serves as a guide on how to set up and use THEIA using Docker. Currently, THEIA can be used on all platforms with Docker support.

## System Requirements

**Operating System:** Must be compatible with Docker. Some commonly used operating systems such as Windows 10 Home are not compatible with Docker, make sure to check your operating system’s compatibility with Docker before starting installation.
**Processor:** Reasonably powerful x86 hardware. Any recent Intel or AMD processor should do. Single core processors are supported.
**Memory:** 8-12GB recommended, more memory may be required for running multiple NLP toolkits in Docker at once. Please check the requirements for CLAMP, MetaMap Lite, and Apache cTAKES. You can customize how much memory each NLP API is allowed by using the related variables when starting the container (see Installation Steps section).
**Disk Space:** Docker image containing entire THEIA architecture occupies 7GB. After setting up the container, up to a total of 23GB of disk space may be occupied, depending which options/components you utilize.

## Software Requirements

**Docker:** [Docker](https://docs.docker.com/get-docker/) is required in order to install and run the THEIA Docker image on your local machine.
**UMLS License:** An UMLS License is required for using provided NLP APIs to process documents. You can apply for a free license [here](https://uts.nlm.nih.gov/license.html).

# Installation Steps

THEIA container comes with a packaged environment that includes the required dependencies. 

1.	Make sure you have [Docker](https://docs.docker.com/get-docker/) installed in your machine.

2.	Configure allocated memory for Docker containers to be sufficient for the THEIA image. From Docker Dashboard, go to Settings → Resources and increase memory to 8GB (or more, depending on how many NLP APIs will be utilized at once).

3.	Download compressed the THEIA Docker image [here](https://drive.google.com/file/d/1lALfb7kX7PpH2hsx82QYcognw4PcGhGu/view?usp=sharing). Extract ```theia_docker.tar``` out of the compressed .zip file.

4.	Go to the directory you extracted ```theia_docker.tar```, and [load](https://docs.docker.com/engine/reference/commandline/load/) the Docker image into your machine:

``` bash
$ docker load --input '.\theia_docker.tar'
```

5.	[Start](https://docs.docker.com/engine/reference/commandline/run/) a container from the loaded image. You can pass in the environment variables you would like to use the customize the container to best fit your needs and resources at this step:

``` bash
$ docker run --name theia \
             --env CLAMP_RUN=1 \
             --env METAMAP_RUN=1 \
             --env CTAKES_RUN=1 \
             --env UMLS_USER=”username” \
             --env UMLS_PASS=”password” \
             -p 80:80 theia
```  

When starting the container, you can pass in environment variables with --env option. THEIA requires/allows following environment variables to be defined by the user:
* ```CLAMP_RUN:``` Whether to include CLAMP indexing and NOTE_NLP table querying functionalities. 1 to include, 0 to not include.
* ```CLAMP_JAVA_OPTS:``` Java arguments passed in when running the THEIA CLAMP Indexer API jar. Can be used to specify how much memory will be allowed for CLAMP inside the container, and more. By default, it is ```“-Xmx8g”```. More explanation on paragraph below.
* ```METAMAP_RUN:``` Whether to include MetaMap Lite indexing functionalities. 1 to include, 0 to not include.
* ```METAMAP_JAVA_OPTS:``` Java arguments passed in when running the THEIA MetaMap Indexer API jar. Can be used to specify how much memory will be allowed for MetaMap Lite inside the container, and more. By default, it is ```“-Xmx8g”```. More explanation on paragraph below.
* ```CTAKES_RUN:``` Whether to include Apache cTAKES indexing functionalities. 1 to include, 0 to not include.
* ```CTAKES_JAVA_OPTS:``` Java arguments passed in when running the THEIA cTAKES Indexer API jar. Can be used to specify how much memory will be allowed for cTAKES inside the container, and more. By default, it is ```“-Xmx8g”```. More explanation on paragraph below.
* ```UMLS_USER:``` The UMLS username to be used by NLP APIs during indexing.
* ```UMLS_PASS:``` The UMLS password to be used by NLP APIs during indexing.

By default, each NLP toolkit is allowed to use up to 8GB of memory, if their API is activated using ```_RUN``` variables mentioned above. If you wish to increase/decrease this amount to better fit your system, you can do so by passing in the according parameters in ```_JAVA_OPTS``` variables mentioned above.
For example, passing in ```–-env CLAMP_JAVA_OPTS=”-Xmx10g”``` will allow CLAMP Indexing API to use 10GB memory for CLAMP indexing. Note that any time you pass in your own parameters with the ```_JAVA_OPTS``` variables, default 8GB memory setting will be overwritten.

Furthermore, you can pass in which ports you want to be able to access from your local machine with ```-p``` option if you wish the interact with the indexing and querying APIs or application database separately from the frontend. List of exposable ports follow:
* 80: exposes frontend application to your local machine.
* 8080: exposes CLAMP indexing and querying API to your local machine.
* 8081: exposes cTAKES indexing API to your local machine.
* 8082: exposes MetaMap indexing API to your local machine.
* 3306: exposes application database to your local machine.

Make sure to expose port 80 to be able to access to THEIA frontend application.

6.	Once the container is successfully created and you see the message that THEIA Frontend interface is available to interact with, you can access THEIA Frontend interface by opening a browser and typing localhost to the address bar. If the container was created successfully, you should see the log-in screen for THEIA when you do so.

# Interacting with THEIA

This section will instructions on how to interact with THEIA using the THEIA frontend application. As mentioned in Installation Steps section, you can access to THEIA frontend application at your localhost after successfully starting the Docker container for THEIA. After registering a new user account or logging in to an user account that already exists, you can interact with THEIA frontent.
The demonstration video can be viewed as an overview of the application guide included below.

## Datasources

Datasources represent users' databases that are formatted based on OMOP Common data model. Users can input their database connection information once, and later select which of their databases they want to interact with for operations such as indexing and querying instantly. In the datasources tab, there’s list of datasources introduced to THEIA that is available for interaction.

To specify a new datasource, use the Add button on top left of the datasources tab. Nicknames and descriptions can be assigned to datasources to easily manage different databases for different operations. For each datasource, you must specify a connection URL, database name, database username, database password, and connector class. At the moment, only MySQL databases are supported, but we will expand the number of supported database management systems in the future.

For your database to be accessible from THEIA, make sure that the database you are introducing to THEIA will be accessible from inside the container. You can do so by creating a user in your database management system that can access to relevant databases from any IP address / Docker container’s IP address, and set the according datasource’s username and password to match with that user.

The action menu on the right allows for further interaction with the datasource. Edit button allows for modification of datasource info, delete button deletes the datasource from the system, and share button allows to share the datasource with other users and groups.

## Indexing

Indexing tab allows users to take documents in their NOTE table, plug them into an NLP toolkit of their choice, and populate their NOTE_NLP table of the database they selected with the NLP outputs.

To create a new index, use the Add button on top left of the indexing tab. Nicknames and descriptions can be assigned to indexes to easily manage different databases for different operations. For the datasource, select the datasource that you want to process with any of the available NLP toolkits. Currently, available toolkits to index are CLAMP, MetaMap Lite, and Apache cTAKES. Note that for CLAMP, pipeline and terminology files can be specified for a more customized search. To find out more about pipelines and terminologies, check their respective sections of this documentation.

The run button on the action menu on the right can be used to start processing the specified datasource for an index. Once the process has been started, the index status will switch to ‘Running’. Once the process is completed, the index status will switch to ‘Completed’.

In the case that the index status switches to ‘Failed’, you will be able to see the reason for failure if you hover your curser over the ‘Failed’ status. Here are some troubleshooting guidelines:
* If the error message is informing you that the API is inactive, this may mean that you may not have set the corresponding environment variable correctly (see Installation steps), or may not have allowed the Docker container to use enough memory (see Installation steps). Alternatively, if you have just initialized the Docker container, this may mean that the API has not been properly activated yet. In such cases, please try again several minutes later.
* If the error message is informing you that your UMLS credentials are invalid, this means that the UMLS credentials passed in during container set-up (see Installation steps) were not valid. Make sure that you input correct UMLS credentials and that you use quotes to surround both the username and the password.
* If the error message is informing you that the pipeline file / terminology folder is invalid, make sure that the pipeline file you have uploaded is working correctly, and make sure that the terminology folder you are specifying exists inside the docker container in the path specified in THEIA.
* If the error message is informing you that the datasource is invalid, the Docker container was not able to find the database. Make sure that the specified database connection URL is accessible from outside of the local machine.
* If the error message is informing you that THEIA was not able to access given database, this may mean the following:
    - No such database
    - Incorrect database user/password information
    - Permission denied for given database user
    - Invalid database driver class

The action menu on the right allows for further interaction with the index. Run button begins indexing, edit button allows for modification of index info, delete button deletes the index from the system, and share button allows to share the index with other users and groups.

## Pipelines

Pipelines tab allows users to view and upload custom pipeline files for CLAMP NLP processing.

To upload a new pipeline, use the Add button on top left of the pipelines tab. Nicknames and descriptions can be assigned to pipelines to easily manage different pipelines for different operations. A default pipeline jar, General Clinical Concept Extraction pipeline (Clamp-ner), CLAMP's default named entity recognition pipeline is made available to all users; however, you are encouraged to upload your own pipeline files to better utilize indexing. Upload the desired pipeline file using the file uploader to make it available to use in the indexing tab for CLAMP processing later on. Please note that the largest pipeline file that you can upload is 2GB.

The action menu on the right allows for further interaction with the pipeline. Edit button allows for modification of pipeline info or updating the pipeline file, delete button deletes the pipeline from the system, and share button allows to share the pipeline with other users and groups.

## Terminologies

Terminologies tab allows users to view and manage terminology settings for CLAMP processing.

In THEIA, terminologies serve as folders storing Lucene indexed UMLS vocabulary used by CLAMP NLP tools. To introduce a new terminology to THEIA, use the Add button on top left of the terminologies tab. Nicknames and descriptions can be assigned to terminologies for convenience. Enter the path to the terminology folder you wish to use as the terminology folder path. By default, THEIA comes with UMLS vocabulary, available inside the Docker container at the following path: 

```/usr/lib/terminologies/umls```

You can further utilize the ```/usr/lib/terminologies``` folder to upload your own terminology indexes generated by CLAMP. You can [transfer](https://docs.docker.com/engine/reference/commandline/cp/) your terminology folders into the docker container from your local machine by using the following command:

``` bash
$ docker cp <terminology folder location on your local machine> \
            <container name>:/usr/lib/terminologies
```

Note that container name is ‘```theia```’ by default.
The action menu on the right allows for further interaction with the terminology. Edit button allows for modification of terminology info, delete button deletes the terminology from the system, and share button allows to share the terminology with other users and groups. It is recommended that terminologies are strictly managed by admin accounts and one terminology entity exists per folder across the entire system, due to large sizes terminology folders can potentially have.

## Querying

Users can reach the querying section from the indexing tab and can query a specific index using the search/query action, which is the magnifying glass icon. Querying section allows users to query their completed indexes. Users can build two main types of queries: concept queries and keyword queries. In concept search, users can search for an OMOP concept given its name or concept ID. In keyword search, users can search for a phrase or a keyword. Using these two types of search, AND/OR queries can be constructed for more detail.

In concept search, you can add multiple concepts in the same box by adding new concepts with the green plus icon. This symbolizes an OR search query including all of the concepts in the box. Adding multiple concepts across multiple boxes symbolize an AND search query among these concepts.
Inside the concept search menu, you can find the concept you are looking for in two ways. Firstly, you can use the concept hierarchy display at the top to navigate through concepts to find concepts you are looking for. Alternatively, you can use the concept search bar below to search the name of the concept you would like to search for and pick it from the results of the search displayed below the bar.

In keyword search, you can add multiple keywords to same box by adding the keywords except the first keyword as synonyms. This symbolizes an OR search query including all the keywords in the box. Adding multiple keywords across multiple boxes symbolize an AND search query among these keywords. Furthermore, concept searches and keyword searches can be combined to form new queries.

Complex queries can be saved using the save button and can be later loaded with the selected query menu. Loaded queries can be overwritten with the save button and duplicated with the save as button. The same query can be used over different indexes by switching indexes from the selected index menu. Clear button can be used to clear the currently loaded query. 

After conducting a concept/keyword search, you will see the results in multiple columns. The first column will give you the note ID, corresponding to the note_id field in the NOTE table that the selected document matching with given query. Following columns display snippets of matching concepts/keywords, where each column corresponds to hits for a subquery that is separated from the rest with an AND clause. The query the results are being displayed for will remain above after query results are obtained.

You can view the note document in more detail by clicking the note id in the corresponding column after search results display. Doing so will open a new popup with two tabs. First tab will display the note in Brat annotation mode, highlighting each concept in the NOTE_NLP table for that note, and will label each concept based on its type by utilizing the DOMAIN table. Note that concepts will not be labelled correctly if there isn’t a DOMAIN table in the OMOP CDM database being queried, or if there isn’t a domain corresponding to that concept in the DOMAIN table of the database being queried. The second tab will list the concepts found and their locations in the document, imitating a visualization of the NOTE_NLP table.

The querying tab allows users to further manage queries created in the querying section by providing the action menus for each query. Delete button deletes the query from the system, and share button allows to share the query with other users and groups.

## Users and Groups

Users tab allows users to view other users registered to THEIA, and groups tab allows users to view a list of groups that they are in.

Currently, users and groups functionalities can be managed to further customize user privileges and access to functionalities of THEIA. By using the admin account, you can change privileges allowed for each user and group in the system. Furthermore, you can use the admin account to create a new user or group with specific privileges. Finally, you can use the admin account to assign users into groups, which allows users to inherit privileges provided by a group, and make it easier to mass-share datasources, pipeline files etc., across the THEIA system.

Note that the admin account can be used to create more admin accounts by creating a new user with full permissions. The log-in for the default admin account is as follows:

**Username:** ```admin```
**Password:** ```dbadmin```
