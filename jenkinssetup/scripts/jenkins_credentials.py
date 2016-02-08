from jenkinsapi.jenkins import Jenkins
from jenkinsapi.credential import UsernamePasswordCredential, SSHKeyCredential

#    class UsernamePasswordCredential(Credential)
#     |  Username and password credential
#     |
#     |  Constructor expects following dict:
#     |      {
#     |          'credential_id': str,   Automatically set by jenkinsapi
#     |          'displayName': str,     Automatically set by Jenkins
#     |          'fullName': str,        Automatically set by Jenkins
#     |          'typeName': str,        Automatically set by Jenkins
#     |          'description': str,
#     |          'userName': str,
#     |          'password': str
#     |      }


api = Jenkins('http://jenkins:8080')
# Get a list of all global credentials
TODO
credentials = api.credentials
for credential in credentials:
	for key in credential.credentials.keys():
		print credential.credentials[key]
			#if credential.credentials['description'] == 'jenkinsslave1 '
creds = api.credentials
credentialsId = creds.credentials.keys()[0]

import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('jenkins',9001))
s.send('CREDENTIALSID ' + credentialsId)


