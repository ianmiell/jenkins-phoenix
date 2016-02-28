#!/bin/bash

function wait_for_jenkins() {
	while [[ $(curl -sL -w "%{http_code}\\n" "http://jenkins:8080" -o /dev/null) != '200' ]]
	do
		echo 'Jenkins not up yet'
		sleep 5
	done
	echo 'Jenkins up and running'
}

wait_for_jenkins

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

# Sleep forever
sleep infinity
