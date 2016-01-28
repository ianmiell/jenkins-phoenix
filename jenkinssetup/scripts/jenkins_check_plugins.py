import jenkins
import time
import jenkins_plugins_list

plugins = jenkins_plugins_list.plugins

# cf: https://updates.jenkins-ci.org/download/plugins/

j = jenkins.Jenkins('http://jenkins:8080')
while True:
    info = j.get_plugins()
    installed_plugins = []
    for key in info.keys():
        installed_plugins.append(key[0])
    break

#print str(set(plugins))
#print str(set(installed_plugins))
#print str(set(plugins) - set(installed_plugins))
if len(set(plugins) - set(installed_plugins)) == 0:
	print 'OK'
else:
	print 'WAIT'
