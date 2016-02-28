FROM jenkins

USER root
RUN apt-get update -y && apt-get install socat

USER jenkins

# Add core jenkins config
ADD config.xml /var/jenkins_home/config.xml
# Add replace_config.sh script to allow updates to config.xml
ADD replace_config.sh /replace_config.sh
# Add startup script and use as entrypoint
ADD startup.sh /var/jenkins_home/startup.sh

ENTRYPOINT ["/var/jenkins_home/startup.sh"]
