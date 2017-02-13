#!/bin/bash

# This script will be called after setting up the used from
# the cburki/sshd image.

C9_STATUS_FILE=/opt/setupc9.status

if [ -f ${C9_STATUS_FILE} ]; then
    exit 0
fi


curl -o /tmp/c9-install.sh https://raw.githubusercontent.com/c9/install/master/install.sh
chmod a+x /tmp/c9-install.sh

if [ -n "${SSH_USER}" ]; then
    runuser -l ${SSH_USER} -c /tmp/c9-install.sh
fi

echo "done" >> ${C9_STATUS_FILE}

exit 0
