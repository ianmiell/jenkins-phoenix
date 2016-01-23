import jenkins
j = jenkins.Jenkins('http://jenkins:8080')
# TODO: only if it doesn't exist
j.create_node('jenkinsslave1')

