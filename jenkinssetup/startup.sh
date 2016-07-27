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

# Set up plugins. Restart until complete
# do a while loop waiting for confirmed installation
echo Plugin install started
pushd plugins
sleeptime=30
while [[ /bin/true ]]
do
	python jenkins_plugins.py
	sleeptime=$(($sleeptime + $sleeptime))
	echo waiting for $sleeptime before re-checking plugins
	sleep $sleeptime
	python jenkins_check_plugins.py
	if [[ $(python jenkins_check_plugins.py | tail -1) = 'OK' ]]
	then
		break
	fi
	restart_and_wait_for_jenkins
done
restart_and_wait_for_jenkins
popd
echo Plugin install complete

# Set up credentials
echo Setting up credentials
pushd credentials
./jenkins_credentials.sh
python jenkins_credentials.py
popd
echo Setting up credentials complete

echo Set up nodes
pushd nodes
python jenkins_node.py
popd
echo Set up nodes done

echo Uploading jobs
pushd jobs
# Use xml to upload docker job
wget -qO- http://jenkins:8080/jnlpJars/jenkins-cli.jar > /jenkins_setup/jenkins-cli.jar
cat docker.xml                   | java -jar /jenkins_setup/jenkins-cli.jar -s http://jenkins:8080 create-job 'dockercloud-echo-job'
cat docker_echo_job.xml          | java -jar /jenkins_setup/jenkins-cli.jar -s http://jenkins:8080 create-job 'docker-echo-job'
cat simple_jenkins_job.xml       | java -jar /jenkins_setup/jenkins-cli.jar -s http://jenkins:8080 create-job 'simple-jenkins-job'
cat workflow_docker.xml          | java -jar /jenkins_setup/jenkins-cli.jar -s http://jenkins:8080 create-job 'dockercloud-pipeline-job'
cat docker_build.xml             | java -jar /jenkins_setup/jenkins-cli.jar -s http://jenkins:8080 create-job 'docker-build'
cat simple_jenkins_swarm_job.xml | java -jar /jenkins_setup/jenkins-cli.jar -s http://jenkins:8080 create-job 'simple-jenkins-swarm-job'
popd
echo Uploading jobs done

# Sleep forever
sleep infinity
