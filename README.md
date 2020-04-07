Ansible Proxy PRs Sandbox
=========

This project provide a sandbox environment to develop and test proxy related Ansible PRs.

It also provide utils to test Ansible modules and other related code.

Please note this repo is not to be used for creating PR. It is not an Ansible source code repo. It merely provides development and test environment.

It has a vagrant box(Proxy Server) providing DNS server and proxy server, and number of vagrant boxes using the proxy and DNS server.
Port 53 and 8888 on Proxy Server are forwarded to Host machine, so other vagrant boxes can access.
Other vagrant boxes (lin-hosts) are disconnected from internet and only has access to the host.

Ansible are installed on all lin-hosts and necessary files are mounted into the vagrant box. The testing is carried out by running
ansible-playbook test.yml on the lin-host box targeting localhost.

The rather complicated architecture is designed to have minimal footprint 
on the PC, so no network setting are changed and no extra software need to be installed. 
The project is disposable and green. 

![a scientific network graph](docs/whiteboard.jpeg "a scientific network graph")

Requirements
------------

* Virtual Box
* Vagrant
* Linux: might also work in Microsoft Windows with few tweaks.
* 'sudo vagrant' permission is required to bring up the control box as it's mapping port 53 

Configuration
-------


Usage
-------


License
-------

Copyright (c) 2020 Hangsu Ma
Simplified BSD License (see licenses/simplified_bsd.txt or https://opensource.org/licenses/BSD-2-Clause)

Author Information
------------------
Hangsu Ma

hangsu.ma@beag.biz
