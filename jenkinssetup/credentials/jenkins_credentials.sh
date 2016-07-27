#!/bin/bash
curl -XPOST 'jenkins:8080/credentials/store/system/domain/_/createCredentials' \
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

echo 'Jenkins username/password credentials created'
