# Jenkins Phoenix Deployment

CI as code.

[Phoenix](http://www.slideshare.net/IanMiell/clipboards/my-clips) [Deployment](https://www.thoughtworks.com/radar/tools/immutable-servers): Never worry about how your environment was built again, because you do it routinely.

Note: requires docker-compose v1.4+

## Intro

See [here](https://zwischenzugs.wordpress.com/2016/01/24/ci-as-code-stateless-jenkins-deployments-using-docker/) for an explanation.

## Tags

### v1.0

basic job management using jenkins job controller

basic credentials management

### v2.0

docker cloud setup

improved plugin installation process

cli container merged into setup container

jenkins contains config.xml with docker cloud setup

jenkins mounts docker socket

## Running

```
docker-compose up
```

or

```
./phoenix.sh
```

Then - once the dust has settled - navigate to http://localhost:8080
