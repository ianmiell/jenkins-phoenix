import jenkins
j = jenkins.Jenkins('http://jenkins:8080')
create = True
for node in j.get_nodes():
	if node['name'] == 'jenkinsslave1':
		create = False
if create:
	j.create_node('jenkinsslave1')

