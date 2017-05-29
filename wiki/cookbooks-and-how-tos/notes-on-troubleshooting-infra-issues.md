# Intro

This graffiti board is for capturing unstructured, informal notes that will be cleaned up later and made into real notes & docs.

These notes are related to troubleshooting various issues with infra.  And validating.  Common commands, etc.

# Scripts & steps used to troubleshoot

## troubleshoot services not working right

### Example:  Steps taken to troubleshoot logging not working right

**Problem**

* There's an issue with logging infrastructure

**Expected**

* Logs from all docker apps should flow into elasticsearch & show up in Kibana
* When Jenkins is deployed, its logs should show up in Kibana

**Actual**

* Jenkins logs NOT showing up in Kibana
* Jenkins logs are sent to FluentD, but FluentD is having an error trying to connect to ElasticSearch.

**Analysis done & what we know**

* Logs not getting into elastic search
* Traced the issue to FLuentD problem connecting to ElasticSearch
* Jenkins is logging to console.  Docker engine is correctly sending logs to FluentD.  So Docker Engine is working correctly.
* FluentD is getting Jenkins logs.  And it's writing Jenkins logs to its console as expected.
* But, when FluentD tries to flush logs to ElasticSearch, getting an error saying it can't connect to ES.
* Steps tried so far:
  - Test elasticSearch.  It's working.  Has index for Kibana, but not for FluentD (logstash)
  - log into FluentD docker container and try to call elasticsearch using the same host and port that's configured.  that works
  - so...connectivity is there between fluentD container and elasticSearch container.  And fluentD is configured with correct host name and port.  so why?
  - stopped fluentD service and deployed new service.  So, FluentD can start, this time with elasticSearch already up and running (in case fluentD previously tried to connect to ES before it was up and available).  Same issue
  - Re-ran automated env-buildout scripts multiple times.  To see if there's a timing issue.  Or some random issue.  Consistently fails with same issue.
* Hypothesis
  - FluentD screws up when you start it before ES is up
  - Not much else
* Next Steps
  - Start with fresh boxes.  Destroy environment.  Create new environment.  But don't automatically provision swarm and configure logging
  - Run 2 manual tests:
    1)  Run the 4 scripts as is.  No delay.  Note how long it takes ES to come up -vs- when FluentD tries to connect.  Is Fluent trying to connect before ES is up?  Expect same error and issue.  The 3 scripts to run:
        * Provision Docker Swarm
        * Deploy Logging Infrastructure
        * Configure Docker Swarm
        * Deploy Admin Apps
    2) Run the first script manually.  But, don't run the deploy logging infra script.  Execute each step 1 at a time.  Make sure ES starts up fully BEFORE deploying fluentD
* Scripts run to diagnose issue
  + Run deploy logging script
  + docker service ps fluentd
  + docker service ps elasticsearch
  + docker service logs fluentd
  + docker service logs elasticsearch

## New scripts that should be created to help make easier to troubleshoot

* infra-swarm-info-service-logs.sh

* infra-swarm-list-service-nodese.sh

* infra-swarm-list-services.sh

* infra-swarm-list-swarm-nodes.sh

* infra-swarm-ssh-node-type-container

* infra-swarm-info-service-get-url 
  - returns
  
  
| url-type | url | host | port |
| --- | ---- | --- | --- |
| domain   | http://XXX    | x   | 80    |
| public-ip   | http://XXX:8191 | x   | 8191    |
| ..   | http://XXX:8192 | x   | 8192    |
| private-ip   | http://XXX:8191 | x   | 8191    |
| ..   | http://XXX:8192 | x   | 8192    | 
| public-dns-name   | http://XXX:8191 | x   | 8191    |
| ..   | http://XXX:8192 | x   | 8192    |
| private-dns-name   | http://XXX:8191 | x   | 8191    |
| ..   | http://XXX:8192 | x   | 8192    |
| internal-docker-network   | http://XXX:8191 | x   | 8191    |
| ..   | http://XXX:8192 | x   | 8192    |

urltype={domain,public-ip,private-ip}


