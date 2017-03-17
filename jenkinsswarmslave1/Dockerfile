FROM ubuntu:trusty
RUN groupadd -g 1000 jenkins
RUN useradd -d /home/jenkins -s /bin/bash -m jenkins -u 1000 -g jenkins
RUN echo jenkins:jpass | chpasswd
RUN apt-get update && apt-get install -y openjdk-7-jre wget unzip
RUN wget -O /home/jenkins/swarm-client-1.22-jar-with-dependencies.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/1.22/swarm-client-1.22-jar-with-dependencies.jar
COPY startup.sh /usr/bin/startup.sh
RUN chmod +x /usr/bin/startup.sh
USER jenkins
ENTRYPOINT ["/usr/bin/startup.sh"]
