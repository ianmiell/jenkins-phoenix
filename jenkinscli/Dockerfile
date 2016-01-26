FROM ubuntu:trusty
RUN apt-get update -y && apt-get install -y default-jdk wget
CMD sleep 180; wget -qO- http://jenkins:8080/jnlpJars/jenkins-cli.jar > jenkins-cli.jar; sleep infinity

