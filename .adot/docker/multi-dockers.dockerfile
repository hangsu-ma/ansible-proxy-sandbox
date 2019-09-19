FROM adot-debian-ansible-docker:1.0.0
<<<<<<< HEAD
=======
ARG ROLE_NAME
>>>>>>> 533fad7... refactor docker image to re-use base images
ARG DOCKER_HOST_IP

COPY .adot/ansible.cfg /etc/ansible/ansible.cfg
COPY .adot/secrets /etc/ansible/secrets
COPY .adot/password-client.sh /etc/ansible/password-client.sh
RUN chmod +x /etc/ansible/password-client.sh
<<<<<<< HEAD
COPY playbooks /etc/ansible/
COPY templates /etc/ansible/templates
COPY vars /etc/ansible/vars
COPY filter_plugins /etc/ansible/filter_plugins

RUN rm -rf /etc/ansible/hosts
COPY inventories /etc/ansible/hosts

COPY .adot/ssh /root/.ssh
RUN chmod 600 -R /root/.ssh
RUN chmod 644 /root/.ssh/id_rsa.pub
COPY .adot/secrets/id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN ansible-galaxy install -r /etc/ansible/requirements.yml

RUN echo "alias ap='ansible-playbook'" >> ~/.bashrc
=======
COPY defaults /etc/ansible/roles/${ROLE_NAME}/defaults
COPY meta /etc/ansible/roles/${ROLE_NAME}/meta
COPY tasks /etc/ansible/roles/${ROLE_NAME}/tasks
COPY templates /etc/ansible/roles/${ROLE_NAME}/templates
COPY vars /etc/ansible/roles/${ROLE_NAME}/vars
COPY filter_plugins /etc/ansible/roles/${ROLE_NAME}/filter_plugins

RUN rm -rf /etc/ansible/hosts
COPY .adot/inventories /etc/ansible/hosts

RUN echo "alias ap='ansible-playbook -e role_name=${ROLE_NAME}'" >> ~/.bashrc
>>>>>>> 533fad7... refactor docker image to re-use base images
RUN echo "cd /etc/ansible" >> ~/.bashrc

ENV DOCKER_HOST=tcp://${DOCKER_HOST_IP}:2375

ENTRYPOINT service ssh restart && echo "Welcome to multi docker Ansible Controller" && bash
