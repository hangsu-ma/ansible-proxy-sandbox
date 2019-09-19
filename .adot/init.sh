#!/bin/bash
ADOTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
PROJECT_NAME=$(basename $(dirname ${ADOTPATH}))
if grep -q hypervisor /proc/cpuinfo; then
  # running in a vm
  ROOT_PATH=/opt/host
else
  # not a vm
  ROLE_NAME=${PROJECT_NAME}
  ROOT_PATH=$( cd "$(dirname ${ADOTPATH})" ; pwd -P )
  DOCKER_HOST_IP=`hostname -I | awk '{print $1}'`
fi
export ROLE_NAME
export ROOT_PATH
export DOCKER_HOST_IP
source ${ADOTPATH}/vagrant/vagrantrc.sh
