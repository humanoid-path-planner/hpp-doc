#!/bin/bash

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

# install ubuntu
debootstrap trusty "$DST"

# put the installation script in the fresh install
cp "${SCRIPT}" "$DST/root/$RUN"

chroot "${DST}" /bin/bash "/root/$RUN"
