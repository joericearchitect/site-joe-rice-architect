
## Useful Docker Swarm Mode command-line examples

## Creating and Joining Swarms and Swarm Nodes

### Create a new Swarm and Manager Node

**Command** - docker swarm init --advertise-addr <MANAGER-IP>

**Example - Create Swarm and Manager Node**

```
    docker swarm init --advertise-addr 192.2.2.0
```

### View swarm join token (will show the token needed to add other nodes to the swarm) ###

**Command** - docker swarm join-token <NODE-TYPE>

**Example - Get the join token for adding manager nodes**

```
     docker swarm join-token manager
```

**Example - Get the join token for adding worker nodes**

```
     docker swarm join-token worker
```

### Join a node to the swarm ###

**Command** - docker swarm join --token <JOIN-TOKEN> <ADVERTISED-ADDR-IP-OF-MANAGER-NODE>:2377

**Example - Join a manager node to swarm (using manager token)**

```
     docker swarm join --token SWMTKN-1-61ztec5k... 192.168.99.100:2377
```

**Example - Join a manager node to swarm (using manager token)**

```
     docker swarm join --token SWMTKN-1-49nj1cmql0jkz... 192.168.99.100:2377
```


### Add labels to a swarm node ###

**Command** - docker node update [OPTIONS] NODE

**Example - Add a label (no value)**

```
     docker node update --label-add webui worker1
```

**Example - Add a label (with a value value)**

```
     docker node update --label-add node-type=webui worker1
```

**Example - Add multiple labels (with and without a value value)**

```
     docker node update --label-add foo --label-add node-type=webui worker1
```



