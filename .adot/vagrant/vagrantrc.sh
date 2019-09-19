#!/usr/bin/env bash
build () {
    if [[ "$(docker images -q adot-debian-ansible:1.0.0 2> /dev/null)" == "" ]]; then
      echo "Building ansible base image..."
      docker build ${ROOT_PATH}/.adot/docker/ -f ${ROOT_PATH}/.adot/docker/base.dockerfile -t adot-debian-ansible:1.0.0
    else
      echo "Using existing ansible base image."
    fi
<<<<<<< HEAD
=======
    docker build ${ROOT_PATH} -f ${ROOT_PATH}/.adot/Dockerfile -t ${ROLE_NAME}:latest --build-arg ROLE_NAME=${ROLE_NAME}
>>>>>>> 533fad7... refactor docker image to re-use base images
    if [[ "$1" = "-m" ]] ; then
        echo "building multi-boxes..."
        if [[ "$(docker images -q adot-debian-ansible-docker:1.0.0 2> /dev/null)" == "" ]]; then
          echo "Building ansible multi boxes base image..."
          docker build ${ROOT_PATH}/.adot/docker/ -f ${ROOT_PATH}/.adot/docker/base-multi.dockerfile -t adot-debian-ansible-docker:1.0.0
        else
          echo "Using existing ansible multi boxes base image."
        fi
<<<<<<< HEAD
        docker build ${ROOT_PATH} -f ${ROOT_PATH}/.adot/docker/multi-dockers.dockerfile -t ${PROJECT_NAME}-multi:latest --build-arg DOCKER_HOST_IP=${DOCKER_HOST_IP}
=======
        docker build ${ROOT_PATH} -f ${ROOT_PATH}/.adot/docker/multi-dockers.dockerfile -t ${ROLE_NAME}-multi:latest --build-arg ROLE_NAME=${ROLE_NAME} --build-arg DOCKER_HOST_IP=${DOCKER_HOST_IP}
>>>>>>> 533fad7... refactor docker image to re-use base images
        if [[ "$(docker images -q ubuntu-host:latest 2> /dev/null)" == "" ]]; then
          echo "Building ubuntu host image..."
          docker build ${ROOT_PATH}/.adot/docker/ -f ${ROOT_PATH}/.adot/docker/ubuntu.dockerfile -t ubuntu-host:latest
        else
          echo "Using existing ubuntu host image."
        fi
<<<<<<< HEAD
    else
        docker build ${ROOT_PATH} -f ${ROOT_PATH}/.adot/Dockerfile -t ${PROJECT_NAME}:latest
=======
>>>>>>> 533fad7... refactor docker image to re-use base images
    fi
}
alias br='build && run'
alias red='docker container rm docker-host -f || true && docker run -t -d  --name docker-host ubuntu-host:latest'
alias dssh='docker exec -it docker-host /bin/bash'
alias dstop='docker container stop docker-host'

run () {
    if [[ "$1" = "-m" ]] ; then
        docker container rm docker-host -f || true
        docker run -t -d  --name docker-host ubuntu-host:latest
        IMAGE_NAME=${PROJECT_NAME}-multi:latest
    else
        IMAGE_NAME=${PROJECT_NAME}:latest
    fi
<<<<<<< HEAD
    PLAYBOOKS=$(_mountAllFiles "/playbooks" "")

    docker run -it \
        -v ${ROOT_PATH}/templates:/etc/ansible/templates \
        -v ${ROOT_PATH}/vars:/etc/ansible/vars \
        -v ${ROOT_PATH}/filter_plugins:/etc/ansible/filter_plugins \
=======
    PLAYBOOKS=$(_mountAllFiles "/.adot/playbooks" "")
    docker run -it \
        -v ${ROOT_PATH}/templates:/etc/ansible/roles/${ROLE_NAME}/templates \
        -v ${ROOT_PATH}/defaults:/etc/ansible/roles/${ROLE_NAME}/defaults \
        -v ${ROOT_PATH}/meta:/etc/ansible/roles/${ROLE_NAME}/meta \
        -v ${ROOT_PATH}/vars:/etc/ansible/roles/${ROLE_NAME}/vars \
        -v ${ROOT_PATH}/filter_plugins:/etc/ansible/roles/${ROLE_NAME}/filter_plugins \
        -v ${ROOT_PATH}/tasks:/etc/ansible/roles/${ROLE_NAME}/tasks \
        -v ${ROOT_PATH}/README.md:/etc/ansible/roles/${ROLE_NAME}/README.md \
>>>>>>> 533fad7... refactor docker image to re-use base images
        -v ${ROOT_PATH}/.adot/ansible.cfg:/etc/ansible/ansible.cfg \
        -v ${ROOT_PATH}/.adot/secrets:/etc/ansible/secrets \
        -v ${ROOT_PATH}/inventories:/etc/ansible/hosts \
        -v ${ROOT_PATH}/.adot/password-client.sh:/etc/ansible/password-client.sh \
<<<<<<< HEAD
        $PLAYBOOKS \
=======
        ${PLAYBOOKS} \
>>>>>>> 533fad7... refactor docker image to re-use base images
        ${IMAGE_NAME}
}

_mountAllFiles() {
    cd ${ROOT_PATH}$1 && for f in *.yml; do echo -n "-v ${ROOT_PATH}$1/$f:/etc/ansible/$f "; done
}
_mountAllDirs() {
    cd ${ROOT_PATH}$1 && for d in */; do echo -n "-v ${ROOT_PATH}$1/$d:/etc/ansible$2/$d "; done
}
