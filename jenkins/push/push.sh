#!/bin/bash

echo "*****************************"
echo "****** Pushing image ********"
echo "*****************************"

IMAGE="kk-maven"

echo "*********** Logging in **************"
docker login -u kappu1512 -p $PASS

echo "*********** Tagging image ***********"
docker tag $IMAGE:$BUILD_TAG kappu1512/$IMAGE:$BUILD_TAG

echo "*********** Pushing image ***********"
docker push kappu1512/$IMAGE:$BUILD_TAG