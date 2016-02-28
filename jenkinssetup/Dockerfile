FROM ubuntu:14.04
RUN apt-get update -y && apt-get install -y git python python-pip python-yaml curl default-jdk wget telnet
RUN pip install setuptools PyYAML python-jenkins ordereddict jenkinsapi
WORKDIR /jenkins_setup
ADD . /jenkins_setup
CMD /jenkins_setup/startup.sh
