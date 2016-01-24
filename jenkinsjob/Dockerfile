FROM ubuntu:14.04
RUN apt-get update -y && apt-get install -y git python python-pip python-yaml curl
RUN pip install setuptools PyYAML python-jenkins ordereddict
RUN git clone https://git.openstack.org/openstack-infra/jenkins-job-builder
WORKDIR jenkins-job-builder
RUN python setup.py install
RUN mkdir -p /etc/jenkins_jobs
ADD jenkins_jobs.ini /etc/jenkins_jobs/jenkins_jobs.ini
ADD scripts /scripts
WORKDIR /scripts
CMD /scripts/startup.sh
