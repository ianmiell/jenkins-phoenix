#!/bin/bash

while [[ $(curl -sL -w "%{http_code}\\n" "http://jenkins:8080" -o /dev/null) != '200' ]]
do
	sleep 5
done
echo 'Jenkins up and running'
./jenkins_credentials.sh
sleep 60
python jenkins_node.py
sleep 60
python jenkins_plugins.py
sleep 60
jenkins-jobs update example_job.yaml 
sleep 60
curl -XPOST http://jenkins:8080/safeRestart
sleep infinity
