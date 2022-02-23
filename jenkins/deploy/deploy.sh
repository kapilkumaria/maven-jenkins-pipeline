#!/bin/bash

echo kk-maven > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth prod-user@3.239.25.157:/tmp/.auth

scp -i /opt/prod ./jenkins/deploy/publish prod-user@3.239.25.157:/tmp/publish

ssh -i /opt/prod prod-user@3.239.25.157 "/tmp/publish"