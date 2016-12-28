# Notes on Getting App to Run on Docker Swarm Mode #

## Overview

### Goals ###

1. Build out the environment (AWS and docker swarm cluster infrastructure)
   - highly available, redundant, and fault-tolerant
   - All infra, swarm nodes, containers, apps, and data are distributed across 3 AWS availability zones

2. Deploy 3 apps and all dependent services to docker swarm cluster
   - JArch Website (Node.js)
   - JArch Blog (Wordpress + MySql)
   - Mine The Catalog Web App (Angular UI, Java REST Service, Cassandra DB)

3. Centralized logging, monitoring & metrics collection for all apps

4. 1), 2), and 3) above completely automated!!
   - From nothingness to all 3 apps compeltely working and monitored
   - Yup, including all AWS infrastructure like VPC, subnets, dns entries, etc.
   - No manual steps or human intervention
   - Using CI / CD Pipeline
   - For reals

### High-Level Approach ###

1. Use Terraform to script out AWS environment and swarm cluster creation
   - Infrastructure as Code
   - Automated and repeatable

2. Use Docker Swarm mode for container scheduling and cluster management
   - All app components, persistence, and infrastructure run as Docker micro-service containers

3. Use Jenkins Pipeline and Blue Ocean plugins for CI / CD
   - Pushbutton plans to:
     + Build out "latest" and "production" environments (using terraform scripts)
     + Spin up ad-hoc dynamic environments (using terraform scripts)
   - CI Pipleline plans to do the following on code checkin:
     + Build code artifacts.  Test and validate (unit tests and code quality)
     + Build new docker image with new code.  Test and validate
     + Push new docker image to Docker registry
     + Deploy new docker image to Swarm nodes in "latest" environment
     + Test and validate new deployed code (functional, integration, and contract tests)

# Observations along the way #

## Docker Swarm ##

* Biggest surprise is that there are actually 2 flavors of Docker Swarm.  And **they are completely different**
  - 1) Old and Busted - Docker Swarm
       - Separate tool - not part of Docker engine - additional software to install
       - You need to configure, setup, and manage a key-value store (consul, etcd, etc) to support cluster management and overlay networks.
  - 2) New Hotness - Docker Engine with Swarm Mode
       - Swarm is now built into Docker Engine itself as of version 1.12.x
       - Cluster management and overlay network support built in.  TLS and PKI built in.  No longer need additional infra to manage.
       - Concepts are roughly the same - with some new features added.
       - Very new.  Imature tooling and guidance.  And not fully integrated other tools like docker compose.

# Early Challenges #

## Docker Swarm ##

* Running into 2 issues to solve:

* Since apps are running in highly available, replicated environment from the start, having to solve a few issues:
  - Data mounting on Docker nodes (how to persist data across container restarts, instance restarts, etc.?)
  - Data replication (how do we run multiple RDMS instances and keep data in sync between all?)
    * run DB in clustered mode?  Run DB container in only 1 node, with data mount

* Docker Swarm support for data volumes is immature.
  - There is a concept of a "mount".
  - But, not for data volume, like regular docker engine.
  - Details are stil murky.

## Terraform ##

* Early observation (I could be wrong) - I have found creating brand new resources from scratch to be reliable.  But, running "apply" against existing infra to effect changes ran into quite a few problems.


