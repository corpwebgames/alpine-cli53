# alpine-cli53

Alpine based [cli53](https://github.com/barnybug/cli53) docker image. Available on [DockerHub](https://hub.docker.com/r/jeekajoo/alpine-cli53/).

## Description

Check healt AWS route53 host service with ROUTE_HOST:PORT add current aws ec2 current host ip to route53 record-set

## Build

```bash
docker build -t aipine-cli53 .
```

## Run 

```bash
docker run -ti -e ROUTE_HOST={route53 host} -e PORT={service port} webgames/alpine-cli53
```
