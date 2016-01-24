#!/bin/bash
curl -XPOST 'localhost:8080/credential-store/domain/_/createCredentials' \
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
