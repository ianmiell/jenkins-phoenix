#!/bin/bash
curl -XPOST 'jenkins:8080/credential-store/domain/_/createCredentials' \
    --data-urlencode 'json={
        "": "0", 
        "credentials": {
            "scope": "GLOBAL", 
            "id": "", 
            "username": "jenkins", 
            "password": "jenkins", 
            "description": "jenkinsslave1 credentials", 
            "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
        }
    }'

#curl -XPOST 'jenkins:8080/credential-store/domain/_/createCredentials' \
#    --data-urlencode 'json={
#        "": "0", 
#        "credentials": {
#            "scope": "GLOBAL", 
#            "id": "", 
#            "username": "root", 
#            "password": "jenkins", 
#            "description": "jenkinsslave1 credentials", 
#            "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
#        }
#    }'

echo 'credentials created'
