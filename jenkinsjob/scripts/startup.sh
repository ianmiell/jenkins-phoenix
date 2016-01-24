#!/bin/bash

while [[ $(curl -sL -w "%{http_code}\\n" "http://jenkins:8080" -o /dev/null) != '200' ]]
do
	sleep 5
done
echo 'Jenkins up and running'
./jenkins_credentials.sh
python jenkins_node.py
python jenkins_plugins.py
jenkins-jobs update example_job.yaml 
sleep infinity
