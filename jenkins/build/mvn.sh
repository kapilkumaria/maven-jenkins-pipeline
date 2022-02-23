#!/bin/bash

echo "***********************************************"
echo "*************** Building Jar ******************"
echo "***********************************************"

WORKSPACE=/home/centos/jenkins-data/jenkins_home/workspace/pipeline-project

# docker run -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.5-alpine "$@"

#docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.5-alpine "$@"

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.5-alpine "$@"