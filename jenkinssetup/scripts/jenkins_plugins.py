import jenkins

# cf: https://updates.jenkins-ci.org/download/plugins/

j = jenkins.Jenkins('http://jenkins:8080')
print 'Installing plugins starting'
j.install_plugin("docker-build-publish")
j.install_plugin("docker-build-step")
j.install_plugin("docker-commons")
j.install_plugin("docker-custom-build-environment")
j.install_plugin("docker-traceability")
j.install_plugin("docker-workflow")
j.install_plugin("docker-notification")
j.install_plugin("docker-plugin")
j.install_plugin("git")
j.install_plugin("github")
j.install_plugin("urltrigger")
j.install_plugin("openshift-pipeline")
j.install_plugin("openshift-deployer")
print 'Installing plugins done, now restart'

