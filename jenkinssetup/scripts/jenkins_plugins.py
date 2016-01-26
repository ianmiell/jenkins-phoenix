import jenkins

# cf: https://updates.jenkins-ci.org/download/plugins/

j = jenkins.Jenkins('http://jenkins:8080')
print 'Installing plugins starting'
info = j.install_plugin("docker-plugin")
info = j.install_plugin("git")
info = j.install_plugin("github")
info = j.install_plugin("urltrigger")
info = j.install_plugin("openshift-pipeline")
info = j.install_plugin("openshift-deployer")
print 'Installing plugins done'



