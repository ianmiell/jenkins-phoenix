#!/bin/bash

function wait_for_jenkins() {
	while [[ $(curl -sL -w "%{http_code}\\n" "http://jenkins:8080" -o /dev/null) != '200' ]]
	do
		echo 'Jenkins not up yet'
		sleep 5
	done
	echo 'Jenkins up and running'
}

function restart_and_wait_for_jenkins() {
	echo Restarting Jenkins
	curl -XPOST http://jenkins:8080/safeRestart
	wait_for_jenkins
}

wait_for_jenkins

# Set up credentials
./jenkins_credentials.sh

# Set up plugins. Restart until complete
# do a while loop waiting for confirmed installation
python jenkins_plugins.py
while [[ $(python jenkins_check_plugins.py | tail -1) != 'OK' ]]
do
	restart_and_wait_for_jenkins
	python jenkins_plugins.py
	echo waiting for 60 before re-checking plugins
	sleep 60
done

echo Plugin install complete

echo Uploading jobs
# Upload jobs using jenkins job builder
jenkins-jobs update example_simple_job.yaml 
jenkins-jobs update example_simple_docker_job.yaml

# Use xml to upload docker job
wget -qO- http://jenkins:8080/jnlpJars/jenkins-cli.jar > /scripts/jenkins-cli.jar
cat /scripts/docker.xml | java -jar /scripts/jenkins-cli.jar -s http://jenkins:8080 create-job 'docker-test'

# Sleep forever
sleep infinity
# Pass file in if required (useful technique)
#socat -u FILE:config.xml TCP:jenkins:9000
