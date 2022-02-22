#!/bin/bash

cp ../..java-app/target/*.jar .

echo "************************************"
echo "****** Building Docker Image *******"
echo "************************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache