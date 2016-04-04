# Jenkins Phoenix Deployment

CI as code.

[Phoenix](http://www.slideshare.net/IanMiell/clipboards/my-clips) [Deployment](https://www.thoughtworks.com/radar/tools/immutable-servers): Never worry about how your environment was built again, because you do it routinely.

Note: requires docker-compose v1.4+

## Intro

See [here](https://zwischenzugs.wordpress.com/2016/01/24/ci-as-code-stateless-jenkins-deployments-using-docker/) for an explanation.

## Tags

### v3.0

Jenkins swarm client example added (jenkinsswarmslave1)

Plugins added for 3.0:
- backup                    - backs up configuration on demand
- jenkinslint               - gives advice on your jenkins setup
- build-timeout             - allow a build timeout
- build-pipeline-plugin     - provides view of build pipeline
- buildgraph-view           - provides alternative view of build pipeline
- delivery-pipeline-plugin  - provides view of delivery pipeline (ie through different environments)
- workflow-aggregator       - continuous delivery pipeline functionality
- docker-build-publish      - build and publish Docker projects to the Docker Hub
- docker-workflow           - use docker commands within pipelines
- greenballs                - green balls for success, not blue!
- swarm                     - allow dynamic jenkins clients to be added via port 50000

`get_job.sh` helper script added

Jobs stored and added using xml

Credential management improved

Updated yaml to docker-compose v1.5+


## Running

```
docker-compose up
```

or

```
./phoenix.sh
```

Then - once the dust has settled - navigate to http://localhost:8080
