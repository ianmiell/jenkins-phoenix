#!/bin/bash

while [[ $(curl -sL -w "%{http_code}\\n" "http://jenkins:8080" -o /dev/null) != '200' ]]
do
	sleep 5
done
echo 'Jenkins up and running'

# Set up credentials
./jenkins_credentials.sh

# Set up plugins. Restart until complete
# do a while loop waiting for confirmed installation
python jenkins_plugins.py
while [[ $(python jenkins_check_plugins.py | tail -1) != 'OK' ]]
do
	python jenkins_check_plugins.py
	echo Restarting Jenkins
	curl -XPOST http://jenkins:8080/safeRestart
	sleep 30
	python jenkins_plugins.py
done

echo Plugin install complete
# Upload jobs using jenkins job builder
jenkins-jobs update example_simple_job.yaml 
jenkins-jobs update example_simple_docker_job.yaml

# Use xml to upload docker job
wget -qO- http://jenkins:8080/jnlpJars/jenkins-cli.jar > /scripts/jenkins-cli.jar
cat /scripts/docker.xml | java -jar /scripts/jenkins-cli.jar -s http://jenkins:8080 create-job 'docker-test'
sleep infinity
# Pass file in if required (useful technique)
#socat -u FILE:config.xml TCP:jenkins:9000
