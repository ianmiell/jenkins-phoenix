FROM jenkins

# Assume root privs
USER root
RUN apt-get update && apt-get install -y vim socat cron sudo docker.io
RUN sed -i 's/^.sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
RUN adduser jenkins sudo
RUN adduser jenkins docker
# switch back to jenkins user
USER jenkins
# Add core jenkins config
#ADD config.xml /var/jenkins_home/config.xml
# Add startup script and use as entrypoint
ADD startup.sh /var/jenkins_home/startup.sh
ENTRYPOINT ["/var/jenkins_home/startup.sh"]
