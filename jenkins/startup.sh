#!/bin/bash

# Use socat to listen on port 9001. If anything comes in, write it out to Jenkins' config.xml
socat -u TCP-LISTEN:9001,reuseaddr,fork EXEC:'/replace_config.sh' &

# The original entrypoint for the jenkins container
/bin/tini -- /usr/local/bin/jenkins.sh
