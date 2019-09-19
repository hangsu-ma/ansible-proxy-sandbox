FROM debian:9
RUN apt-get update && apt-get install -y gnupg2

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
 && apt-get update \
 && apt-get install -y ansible vim ssh apt-transport-https python-pip libpq-dev python-dev git\
 && pip install -q "pywinrm>=0.3.0" cryptography \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

ENTRYPOINT service ssh restart && echo "base image" && bash
