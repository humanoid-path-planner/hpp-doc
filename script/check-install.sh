#!/bin/bash

DISTRIBUTION=trusty

## Check whether we are inside LAAS.
DOMAINNAME=`hostname -d`
if [ ${DOMAINNAME} = "laas.fr" ]; then
  # Use mirror from LAAS
  MIRROR="http://kiev.laas.fr/UBUNTU-MIRROR/"
else
  MIRROR="http://archive.ubuntu.com/ubuntu/"
fi

# read arguments
if [ $# -ne 1 ] && [ $# -ne 2 ]; then
  echo "usage: $0 <install-directory> <bash_script_to_launch>"
  exit 1
fi

DST="$1"
if [ $# -eq 2 ]; then
  SCRIPT="$2"
else
  HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  SCRIPT="$HERE/auto-install-hpp.sh"
fi

if [ -f ${SCRIPT} -a -r ${SCRIPT} ]; then
  echo "Will run '/bin/bash ${SCRIPT}' in the fresh install."
else
  echo "${SCRIPT} not found"
  exit 1
fi

RUN=`basename "${SCRIPT}"`

### Install ubuntu
debootstrap ${DISTRIBUTION} "$DST" ${MIRROR}

### Configure the repositories
# ROS
sh -c "echo 'deb http://packages.ros.org/ros/ubuntu ${DISTRIBUTION} main' > ${DST}/etc/apt/sources.list.d/ros-latest.list"
chroot ${DST} /usr/bin/apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

# Ubuntu
sh -c "echo '# Intentionally empty' > ${DST}/etc/apt/sources.list"
sh -c "echo 'deb ${MIRROR} ${DISTRIBUTION} main universe' > ${DST}/etc/apt/sources.list.d/${DISTRIBUTION}.list"

# Update
chroot ${DST} /usr/bin/apt-get update
chroot ${DST} /usr/bin/apt-get --assume-yes upgrade

# Install dependencies
# FIXME: I do not know why this is not in the installed Ubuntu. Is wget missing in Ubuntu 14.04
# or is it deboostrap that is not installing the good version ?
chroot ${DST} /usr/bin/apt-get --assume-yes install wget
# This is required by OpenSceneGraph and is usually installed with Ubuntu 14.04 and graphic card
# drivers.
chroot ${DST} /usr/bin/apt-get --assume-yes install freeglut3-dev

### Run the script
cp "${SCRIPT}" "$DST/root/$RUN"

chroot "${DST}" /bin/bash "/root/$RUN"
