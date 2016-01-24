import jenkins
j = jenkins.Jenkins('http://jenkins:8080')
print j.get_credentials()
#params = {
#	'port': '22',
#	'username': 'jenkins',
#	'password': 'jenkins',
#	'host': 'jenkinsslave1'
#}
#create = True
#for node in j.get_nodes():
#	if node['name'] == 'jenkinsslave1':
#		create = False
#if create:
#	j.create_node(
#		'jenkinsslave1',
#		nodeDescription='my test slave',
#		remoteFS='/tmp',
#		labels='jenkinsslave1',
#		launcher=jenkins.LAUNCHER_SSH,
#		launcher_params=params
#	)
#
## create node with parameters
#params = {
#    'port': '22',
#    'username': 'juser',
#    'credentialsId': '10f3a3c8-be35-327e-b60b-a3e5edb0e45f',
#    'host': 'my.jenkins.slave1'
#}
#server.create_node(
#    'slave1',
#    nodeDescription='my test slave',
#    remoteFS='/home/juser',
#    labels='precise',
#    exclusive=True,
#    launcher=jenkins.LAUNCHER_SSH,
#    launcher_params=params)
#
