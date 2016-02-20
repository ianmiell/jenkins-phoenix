from jenkinsapi.jenkins import Jenkins
from jenkinsapi.credential import UsernamePasswordCredential, SSHKeyCredential
	
api = Jenkins('http://jenkins:8080')
# Get a list of all global credentials
creds = api.credentials
credentialsId = creds.credentials.keys()[0]

import jenkins 

j = jenkins.Jenkins('http://jenkins:8080')

# jenkins slave
params = {
	'port': '22',
	'username': 'jenkins',
	'credentialsId': credentialsId,
	'host': 'jenkinsslave1'
}
create = True
for node in j.get_nodes():
	if node['name'] == 'jenkinsslave1':
		create = False
if create:
	j.create_node(
		'jenkinsslave1',
		nodeDescription='my test slave',
		remoteFS='/tmp',
		labels='jenkinsslave',
		launcher=jenkins.LAUNCHER_SSH,
		launcher_params=params
	)

# jenkins docker slave
params = {
	'port': '22',
	'username': 'jenkins',
	'credentialsId': credentialsId,
	'host': 'jenkinsdockerslave1'
}
create = True
for node in j.get_nodes():
	if node['name'] == 'jenkinsdockerslave1':
		create = False
if create:
	j.create_node(
		'jenkinsdockerslave1',
		nodeDescription='my docker test slave',
		remoteFS='/tmp',
		labels='jenkinsdockerslave',
		launcher=jenkins.LAUNCHER_SSH,
		launcher_params=params
	)
