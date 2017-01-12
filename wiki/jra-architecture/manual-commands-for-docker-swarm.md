# Manual Commands used for JRA Docker Swarm #

## Overview ##

As of right now, 12/27/16, there are some manual steps that have to be done to set up the docker swarm cluster.

This page documents those manual steps....until it is all automated at some point in the future.

**Update, 1/8/2017**

As of today, 1/8/16, setting up docker swarm cluster is indeed automated!  The future is here.

![And there was much rejoicing in the land](much-rejoicing.gif)

Will continue adding commands in this wiki page as more gets automated.  1) to help capture them during script writing phase and 2) so they are available for future wiki and blog posts.

### What is automated ###

Terraform will create all the AWS infrastructure.  Including
* a new VPC,
* public and private subnets,
* security groups
* internet gateway for public subnet
* NAT gateway for private subnet
* EC2 instances for all Swarm Nodes - Managers & Workers
* All of the above is repeated in In 3 avail zones

### What is not automated ###

* Creation of the docker swarm
* joining manager and worker swarm nodes

The reason is this:
* when you create a swarm and the first swarm manager, it will generate 2 tokens:  manager token and worker token
* all subsequent swarm nodes must join the swarm using the tokens that were generated in previous step
* problem:
  + the swarm creation is done as part of a terraform provision script
  + terraform has no way of capturing the output of a provision script in 1 resource and passing it into another resource
  + So...can use terraform to create the swarm and the first swarm manager.  But, can't use it to join other manager and worker nodes.

**Update, 1/7/2017**

* Docker Swarm Buildout is now completely automated.
* Running int the problem with terraform turned out to be a good thing.
  +  Terraform should only be used to be out infrastructure.  Not set them up or configure them.
  +  Best practice is to use a provisioning tool for that.
  +  And that's exactly what I did
* Using Ansible to provision the swarm.  Ansible is the simplest and easiest of the config tools (chef, puhpet, etc).
  +  After terraform build out the VPC and instances, it calls ansible script to configure the swarm.

## Commands ##

**Update, 1/12/2017**

Most commands listed in this section were the starting points for the scripts.
They may now be out of date.  See the following script files for the source of truth for proper configuration of these commands:

* Ansible script to provision the docker swarm, including setting up all manager and worker swarm nodes, adding labels, and the such.
  -  https://github.com/joericearchitect/shared-infra/blob/master/environments/ansible/swarm.yml

* Ansible script to deploy infra docker services
  -  https://github.com/joericearchitect/shared-infra/blob/master/environments/ansible/deploy-infra-apps-services.yml


**Commands run on the first Swarm Manager Nodes**

* Create the swarm and get the worker and manager tokens (run on first swarm node)

```
   docker swarm init --advertise-addr <IP Address of 1st Swarm Manager Ec2 Instance>
   docker swarm join-token manager
   docker swarm join-token worker
```

* Note the tokens returned from the last 2 commands.  Will use those tokens in next steps

**Commands run on the other 2 Swarm Manager Nodes**

* join the swarm as manager node

```
   docker swarm join \
      --token <Manager Token from Above> <IP Address of 1st Swarm Manager Ec2 Instance>:2377
```

**Commands run on all Worker Nodes**

* join the swarm as worker node

```
   docker swarm join \
      --token <Worker Token from Above> <IP Address of 1st Swarm Manager Ec2 Instance>:2377
```

**Commands run on all Swarm Manager & Worker Nodes**

* Update to add all the labels to each swarm node - Swarm Manager

```
   docker node update \
      --label-add name=jra.swarm-manager.manager.latest.us-east-1-az-1.i-1 \
      --label-add environment=latest \
      --label-add environment_type=latest \
      --label-add failure_zone=us-east-1-az-1 \
      --label-add environment-size=small \
      --label-add swarm-instance-type=swarm-manager \
      --label-add swarm-node-type=swarm-manager \
      --label-add subnet-type=private \
      ip-10-0-1-6

   docker node update \
      --label-add name=jra.swarm-manager.manager.latest.us-east-1-az-2.i-1 \
      --label-add environment=latest \
      --label-add environment_type=latest \
      --label-add failure_zone=us-east-1-az-2 \
      --label-add environment-size=small \
      --label-add swarm-instance-type=swarm-manager \
      --label-add swarm-node-type=swarm-manager \
      --label-add subnet-type=private \
      ip-10-0-3-46

   docker node update \
      --label-add name=jra.swarm-manager.manager.latest.us-east-1-az-3.i-1 \
      --label-add environment=latest \
      --label-add environment_type=latest \
      --label-add failure_zone=us-east-1-az-3 \
      --label-add environment-size=small \
      --label-add swarm-instance-type=swarm-manager \
      --label-add swarm-node-type=swarm-manager \
      --label-add subnet-type=private \
      ip-10-0-5-136

```

* Update to add all the labels to each swarm node - Swarm Node - Web UI

```
   docker node update \
      --label-add name=jra.swarm-node.app-ui-web.latest.us-east-1-az-1.i-1 \
      --label-add environment=latest \
      --label-add environment_type=latest \
      --label-add failure_zone=us-east-1-az-1 \
      --label-add environment-size=small \
      --label-add swarm-instance-type=swarm-node \
      --label-add swarm-node-type=app-ui-web \
      --label-add subnet-type=public \
      ip-10-0-0-121

   docker node update \
      --label-add name=jra.swarm-node.app-ui-web.latest.us-east-1-az-2.i-1 \
      --label-add environment=latest \
      --label-add environment_type=latest \
      --label-add failure_zone=us-east-1-az-2 \
      --label-add environment-size=small \
      --label-add swarm-instance-type=swarm-node \
      --label-add swarm-node-type=app-ui-web \
      --label-add subnet-type=public \
      ip-10-0-2-84

   docker node update \
      --label-add name=jra.swarm-node.app-ui-web.latest.us-east-1-az-3.i-1 \
      --label-add environment=latest \
      --label-add environment_type=latest \
      --label-add failure_zone=us-east-1-az-3 \
      --label-add environment-size=small \
      --label-add swarm-instance-type=swarm-node \
      --label-add swarm-node-type=app-ui-web \
      --label-add subnet-type=public \
      ip-10-0-4-156

```

###Commands to Deploy Infrastructure Apps and Services###

* Schedule a traefik container (traefik is a dynamic reverse-proxy)

```
   docker network create --driver=overlay jarch-proxy-traefik-network

   docker service create \
   --name jarch-infra-proxy-traefik \
   --constraint 'node.role == manager' \
   --constraint 'node.labels.com.jra.failure-zone == us-east-1-az-1' \
   --label traefik.docker.network=jarch-proxy-traefik-network \
   --label traefik.port=8080 \
   --label traefik.frontend.rule=Host:proxy.joericearchitect.com\
   --label environment-flip="blue" \
   --label application-name="jarch-infra-proxy-traefik" \
   --label container-name="jarch-infra-proxy-traefik" \
   --publish 80:80 \
   --publish 8188:8080 \
   --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
   --network jarch-proxy-traefik-network \
   traefik:v1.1.0 \
   --docker \
   --docker.swarmmode \
   --docker.domain=traefik \
   --docker.watch \
   --web

```

* Schedule a registry container

```
   docker service create \
   --name jarch-infra-docker-registry \
   --publish 8183:5000 \
   --network jarch-proxy-traefik-network \
   --mount type=bind,src=/usr/local/jra/docker-data-volumes/jra-infra/docker-registry/data,dst=/var/lib/registry \
   --mount type=bind,src=/usr/local/jra/docker-data-volumes/jra-infra/docker-registry/certs,dst=/certs \
   --constraint 'node.labels.com.jra.swarm-node-type == build' \
   --label traefik.docker.network=jarch-proxy-traefik-network \
   --label traefik.port=5000 \
   --label traefik.frontend.rule=Host:docker.joericearchitect.com \
   --label environment-flip="blue" \
   --label application-name="jarch-infra-docker-registry" \
   --label container-name="jarch-infra-docker-registry" \
   registry:2

```

* Schedule a jenkins container

```
   docker service create \
   --name jarch-infra-build-jenkins \
   --publish 8180:8080 \
   --replicas=1 \
   --constraint 'node.labels.com.jra.swarm-node-type == build' \
   --network jarch-proxy-traefik-network \
   --mount type=bind,src=/usr/local/jra/docker-data-volumes/jra-infra/build-jenkins/home,dst=/var/jenkins_home \
   --label traefik.docker.network=jarch-proxy-traefik-network \
   --label traefik.port=8080 \
   --label traefik.frontend.rule=Host:build.joericearchitect.com\
   --label environment-flip="blue" \
   --label application-name="jarch-infra-build-jenkins" \
   --label container-name="jarch-infra-build-jenkins" \
   jenkins

```

* Schedule a Portainer container

```
docker service create \
   --name jarch-infra-docker-ui-portainer \
   --publish 8184:9000 \
   --constraint 'node.role == manager' \
   --constraint 'node.labels.com.jra.failure-zone == us-east-1-az-2' \
   --network jarch-proxy-traefik-network \
   --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
   --mount type=bind,src=/usr/local/jra/docker-data-volumes/jra-infra/docker-ui-portainer/data,dst=/data \
   --label traefik.docker.network=jarch-proxy-traefik-network \
   --label traefik.port=9000 \
   --label traefik.frontend.rule=Host:dockerui.joericearchitect.com\
   --label environment-flip="blue" \
   --label application-name="jarch-infra-docker-ui-portainer" \
   --label container-name="jarch-infra-docker-ui-portainer" \
    portainer/portainer \
    -H unix:///var/run/docker.sock

```

###Commands to Deploy JArchitecture Site and Services###

* Schedule a jrasite container

```
   docker service create \
   --name jarch-site-web-static \
   --publish 8080:8080 \
   --replicas=3 \
   --network jarch-proxy-traefik-network \
   --constraint 'node.labels.com.jra.swarm-node-type == app-ui-web' \
   --label traefik.docker.network=jarch-proxy-traefik-network \
   --label traefik.port=8080 \
   --label traefik.frontend.rule=Host:www.joericearchitect.com\
   --label environment-flip="blue" \
   --label application-name="jarch-site-web-static" \
   --label container-name="jarch-site-web-static" \
   joericearchitect/jarch-site-web-static

```

###Commands to set up replicated MySQL containers###

Following this great blog from several nines to set it all up
* http://severalnines.com/blog/mysql-docker-introduction-docker-swarm-mode-and-multi-host-networking


* create a docker swarm overlay network

```
docker network create --driver overlay jarch-blog-wordpress-network

```

* get etcd discovery url

```
curl -w "\n" 'https://discovery.etcd.io/new?size=1'

```

* schedule etcd service using the etcd discovery url generated above

```
docker service create \
   --name jarch-blog-wordpress-mysql-etcd \
   --replicas 1 \
   --constraint 'node.labels.com.jra.swarm-node-type == app-persistence' \
   --label environment-flip="blue" \
   --label application-name="jarch-blog-wordpress-mysql-etcd" \
   --label container-name="jarch-blog-wordpress-mysql-etcd" \
   --network jarch-blog-wordpress-network \
   --mount type=bind,src=/usr/local/jra/docker-data-volumes/jra-infra/docker-registry/data,dst=/var/lib/registry \
   --mount type=bind,src=/usr/local/jra/docker-data-volumes/jra-infra/docker-registry/certs,dst=/certs \
   --publish 2379:2379 \
   --publish 2380:2380 \
   --publish 4001:4001 \
   --publish 7001:7001 \
   elcolio/etcd:latest \
   -name etcd \
   -discovery=<ETC_DISCOVERY_URL>

```

* Get the Virtual IPs of the etc instance.

```
docker service inspect jarch-blog-wordpress-mysql-etcd -f "{{ .Endpoint.VirtualIPs }}"

```

**Note:** This command will return 2 virtual IPs.  The 1st one is for the default bridge network.  The 2nd one is foe the overlay network.  We are going to use the 2nd one in the step below.

* schedule Galera (Percona XtraDB Cluster) containers.  This is a clustered MySql instance.

```
docker service create \
   --name jarch-blog-wordpress-mysql-galera \
   --replicas 3 \
   --constraint 'node.labels.com.jra.swarm-node-type == app-persistence' \
   --label environment-flip="blue" \
   --label application-name="jarch-blog-wordpress-mysql-galera" \
   --label container-name="jarch-blog-wordpress-mysql-galera" \
   --publish 3306:3306 \
   --network jarch-blog-wordpress-network \
   --env MYSQL_ROOT_PASSWORD=mypassword \
   --env DISCOVERY_SERVICE=jarch-blog-wordpress-mysql-etcd:2379 \
   --env XTRABACKUP_PASSWORD=mypassword \
   --env CLUSTER_NAME=galera \
perconalab/percona-xtradb-cluster:5.6
```

* schedule JArch Word Press Containers

```
docker service create \
   --name jarch-blog-wordpress-ui \
   --publish 8081:80 \
   --replicas=3 \
   --network jarch-proxy-traefik-network \
   --network jarch-blog-wordpress-network \
   --constraint 'node.labels.com.jra.swarm-node-type == app-ui-web' \
   --label traefik.docker.network=jarch-proxy-traefik-network \
   --label traefik.port=80 \
   --label traefik.frontend.rule=Host:blog.joericearchitect.com \
   --label environment-flip="blue" \
   --label application-name="jarch-blog-wordpress-ui" \
   --label container-name="jarch-blog-wordpress-ui" \
   --env WORDPRESS_DB_HOST=jarch-blog-wordpress-mysql-galera:3306 \
   --env WORDPRESS_DB_USER=root \
   --env WORDPRESS_DB_PASSWORD=mypassword \
   joericearchitect/jarch-blog-wordpress-ui


```
