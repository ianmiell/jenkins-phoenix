#!/bin/bash

# Set up a cron daemon (logging heavily) in case we need to run periodic jobs
sudo cron -L 8

# Use socat to listen on port 9000. If anything comes in, write it out to Jenkins' config.xml
# Can be called from a linked machine like so:
#socat -u FILE:config.xml TCP:jenkins:9000
# If this is used, we need to trigger a restart also.
socat -u TCP-LISTEN:9000,reuseaddr,fork OPEN:/var/jenkins_home/config.xml,creat,trunk &
socat -u TCP-LISTEN:9001,reuseaddr,fork EXEC:'/replace_config.sh > /tmp/asd && tac /tmp/asd' &

# The original entrypoint for the jenkins container
/bin/tini -- /usr/local/bin/jenkins.sh
