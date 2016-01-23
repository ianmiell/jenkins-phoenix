FROM ubuntu:14.04
RUN apt-get update -y && apt-get install -y git python python-pip python-yaml
RUN pip install setuptools PyYAML python-jenkins ordereddict
RUN git clone https://git.openstack.org/openstack-infra/jenkins-job-builder
WORKDIR jenkins-job-builder
RUN python setup.py install
ADD example_job.yaml /example_job.yaml
RUN mkdir -p /etc/jenkins_jobs
ADD scripts /scripts
ADD jenkins_node.py /jenkins_node.py
ADD jenkins_node.py /jenkins_node.py
ADD startup.sh /startup.sh
WORKDIR /scripts
CMD startup.sh
