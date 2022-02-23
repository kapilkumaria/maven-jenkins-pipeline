#!/bin/bash

echo "***************************************************"
echo "*************** Testing the Code ******************"
echo "***************************************************"

WORKSPACE=/home/centos/jenkins-data/jenkins_home/workspace/new-pipeline-project

docker run -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.5-alpine "$@"