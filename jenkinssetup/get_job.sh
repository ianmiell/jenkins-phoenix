#!/bin/bash

java -jar jenkins-cli.jar -s http://jenkins:8080 get-job $1 
