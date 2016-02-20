from jenkinsapi.jenkins import Jenkins
from jenkinsapi.credential import UsernamePasswordCredential, SSHKeyCredential
import socket

api = Jenkins('http://jenkins:8080')
# Get a list of all global credentials
credentials = api.credentials
for key in credentials.credentials.keys():
		creds_dict = credentials.credentials[key].get_attributes()
		if creds_dict['json']['credentials']['description'] == 'jenkinsslave1 credentials':
				credentialsId = creds_dict['json']['credentials']['id']
				s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
				s.connect(('jenkins',9001))
				s.send('/var/jenkins_home/config.xml JENKINSSLAVE1_CREDENTIALSID ' + credentialsId)
