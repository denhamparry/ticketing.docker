# Ticketing.Docker

## Network

### Network setup

```bash
$ docker network create -d bridge ticketing-network
ef6dad28d08b
```

### Network status

```bash
$ docker network ls
NETWORK ID          NAME                                    DRIVER              SCOPE
ef6dad28d08b        ticketing-network                       bridge              local
...
```

### Network delete

```bash
$ docker network rm ticketing-network
ticketing-network
```

## Containers

### Containers setup

```bash
$ docker run --name ticketing.messaging --network=ticketing-network -d rabbitmq:3-management
$ docker run --name ticketing.mongo --network=ticketing-network -d mongo
$ docker run --name ticketing.api --network=ticketing-network -d -p 3000:80 denhamparry/ticketing.api
$ docker run --name ticketing.worker --network=ticketing-network -d denhamparry/ticketing.worker
```

### Containers delete

```bash
$ docker rm -f $(docker ps -a -q -f "name=ticketing.*")
```