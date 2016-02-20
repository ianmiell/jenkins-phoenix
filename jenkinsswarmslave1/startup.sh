#!/bin/bash
SLAVE_JENKINS_SERVER=jenkins
SLAVE_JENKINS_PORT=8080
SLAVE_JENKINS_LABELS=swarm
SLAVE_JENKINS_HOME=${JENKINS_HOME:-$HOME}
echo "Starting up swarm client with args:"
echo "$@"
echo "and env:"
echo "$(env)"
set -x
java -jar /home/jenkins_slave/swarm-client-1.22-jar-with-dependencies.jar -fsroot "$SLAVE_JENKINS_HOME" -labels "$SLAVE_JENKINS_LABELS" -master http://$SLAVE_JENKINS_SERVER:$SLAVE_JENKINS_PORT $@
sleep infinity
