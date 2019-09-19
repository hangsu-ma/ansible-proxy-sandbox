FROM adot-debian-ansible:1.0.0
<<<<<<< HEAD
=======
ARG ROLE_NAME
>>>>>>> 533fad7... refactor docker image to re-use base images

COPY .adot/ansible.cfg /etc/ansible/ansible.cfg
COPY .adot/secrets /etc/ansible/secrets
COPY .adot/password-client.sh /etc/ansible/password-client.sh
RUN chmod +x /etc/ansible/password-client.sh
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
RUN echo "cd /etc/ansible" >> ~/.bashrc

ENTRYPOINT service ssh restart && echo "Welcome to Ansible Controller Image for Playbook Startkit" && bash
