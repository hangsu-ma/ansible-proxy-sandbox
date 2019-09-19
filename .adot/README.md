Ansible Playbook Startkit
=========
This folder contain utilities scripts to help develop Ansible playbook/s.
It will create a VM using vagrant as sandbox on windows; installing Docker in the VM;
then create docker image/s with Ansible installed; containers created from that image can be used as control and host
to test role; Ansible role will be mapped in the container/s

The VM and docker images created are named after the project root dir name.

Requirements
------------
* Virtual Box
* Vagrant

Usage
------------
* Existing project: Copy _.adot_ folder and everything in it into the role root folder.
* New project: clone this repo into a folder match it's project name, then start develop!
* update _vagrant.yml_ with desired value
* _vagrant up_ to start main VM
* start extra windows host if develop playbook for windows: _vagrant up win_host_ 
* start extra Linux VM host if requires UI: _vagrant up linux_host_ 

Encryption
------------
Supporting ansible vault.

* creating a _secrets_ dir in _.adot_
* creating file/s inside _secrets_ dir, with one line clear text password in it
* file name should match desired vault id
* update _vault_identity_list_ in ansible.cfg for new vault id
* place var needs to be encrypted in vault.yml
* use _ansible-vault encrypt --encrypt-vault-id dev vault.yml to encrypt the file

_password-client.sh_ script will be used to return password from password file name matching vault id
 
the _.dot/secrets_ dir is git ignored for obvious reason

Authentication
------------
ssh key can be configured in the created Ansible controller docker image to be able to clone from bitbucket/github private repos

* creating a _secrets_ dir in _.adot_
* run _ssh-keygen -t rsa_ in a Linux env, generate id_rsa and id_rsa.pub key pair if they are not prepared
* copy id_rsa.pub into _.adot/ssh_ folder, overwrite existing file
* copy id_rsa into _.adot/secrets_ folder, do not commit it 
* add the id_rsa.pub into your Bitbucket/Github account

Linux Support
------------
In Linux Env, vagrant box is not required to provide a docker engine, 
the machine wise docker engine can be used, however this is not recommended as it will introducing interference between projects.

**Only support bash**

* bash
* cd .adot && source init.sh
* now you can use _build_ and _run_ 

**TODO**:
Docker file should be refactored to base on same base image cross projects. 
Especially the part install Ansible and Docker, this will dramatically reduce image build time.

Author Information
------------------

Hangsu Ma

hangsu.ma@beag.biz
