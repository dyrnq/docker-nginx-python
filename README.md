# docker-nginx-python

NGINX Container with python

## features

- debian base image
- nginx uid=1000
- nginx gid=1000
- s6-overlay

## Ports

- 80/tcp: HTTP Port
- 443/tcp: HTTPS Port

## Mount Points

- /etc/nginx/conf.d/

## run

```bash
docker run -d -e TZ=Asia/Shanghai dyrnq/nginx-python:3.8.8
```

## build

```bash
docker build --build-arg PYTHON_TAG=3.8.8-buster -t IMAGE:TAG .
```

## ref

- <https://docs.docker.com/docker-hub/builds/advanced/>
- <https://github.com/just-containers/s6-overlay>
