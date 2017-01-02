# Manual Commands used for JRA Docker Swarm #

## Overview ##

As of right now, 12/27/17, there are some manual steps that have to be done to set up the docker swarm cluster.

This page documents those manual steps.

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

## Commands ##

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


