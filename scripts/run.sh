#!/bin/sh
APP_ROOT=`pwd`
DEPENDENCIES="target/dependency"

# build and test with maven
mvn -N wrapper:wrapper
./mvnw package

# layers approach
mkdir -p "$DEPENDENCIES"
cd "$DEPENDENCIES"
jar -xf ../*.jar
cd "$APP_ROOT"

# build image and run container
docker build -t poc/application .
docker run -p 8080:8080 poc/application
