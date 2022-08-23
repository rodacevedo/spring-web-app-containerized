# A SpringBoot Web Application Containerized for OpenShift

## Objective
Containerize an existing SpringBoot SpringWeb application to deploy onto OpenShift

## Pre-requisites
- [JDK 11 or greater](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [Maven](https://maven.apache.org/download.cgi)
- [Docker](https://docs.docker.com/get-docker/)
- [SpringWeb application](https://start.spring.io/)

## Build and deploy locally
```
# one time only
mvn -N wrapper:wrapper

# build the application jar
./mvnw package

# deploy locally
java -jar target/Application-0.0.1-SNAPSHOT.jar
```

## Containerize the application
The dockerfile provides a series of instructions to build the container image. This dockerfile uses Amazon Correto with jdk 18 as base image. 

To build an image with our jar file, run the `run.sh` under `scripts`:
```
scripts/run.sh
```

This script will:
- Build the application into a jar file
- Run unit tests
- Explode jar into dependencies and app classes
- Build the docker image locally
- Run the docker container locally and expose the application on port 8080

Open `http://localhost:8080/` in your browser to open the web application

## Building and running manually
```
# build top level image
docker build -t poc/application .

# list out images
docker images

# create a running container and expose it on port 8080
# use -d option for detached mode
docker run -p 8080:8080 poc/application

# show running containers
docker ps -a

# to access the container in iteractive mode
docker exec -ti <container_id> /bin/sh

# if running on detached mode, run this to stop the running container
docker stop <container_id>

```

