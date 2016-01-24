#!/bin/bash

while [[ $(curl -sL -w "%{http_code}\\n" "http://jenkins:8080" -o /dev/null) != '200' ]]
do
	sleep 5
done
wait=20
echo 'Jenkins up and running'
./jenkins_credentials.sh
echo Waiting $wait seconds
sleep $wait
python jenkins_node.py
python jenkins_plugins.py
echo Waiting $wait seconds
sleep $wait
jenkins-jobs update example_simple_job.yaml 
jenkins-jobs update example_simple_docker_job.yaml 
echo Restarting Jenkins
curl -XPOST http://jenkins:8080/safeRestart
sleep infinity
