FROM ubuntu:18.04
RUN apt-get remove docker docker-engine docker.io containerd runc || true
RUN apt-get update \
 && apt-get install -y python\
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT echo "Welcome to Ubuntu 18.04 host" && bash
