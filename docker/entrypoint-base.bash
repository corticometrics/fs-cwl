#!/bin/bash

CONTAINER_ID=`cat /proc/self/cgroup | grep "cpu:/" | sed 's/\([0-9]\):cpu:\/docker\///g'`

echo "---------------------------------------------------------------"
echo "This is ContainerID: $CONTAINER_ID"
echo "---------------------------------------------------------------"
echo "entrypoint-base.bash ENVIRONMENT VARIABLES"
echo ""
echo "FS_KEY:                   $FS_KEY"
echo "---------------------------------------------------------------"

if [ -n "${FS_KEY}" ]; then
  echo "---------------------------------------------------------------"
  echo "FS_KEY detected. Creating /opt/freesurfer/license.txt."
  echo $FS_KEY | base64 -d > /opt/freesurfer/license.txt
  echo "The file /opt/freesurfer/license.txt now looks like:"
  cat /opt/freesurfer/license.txt
  echo "---------------------------------------------------------------"
else
  echo "No FS_KEY detected. Not creating license.txt file. Freesurfer probably wont work."
fi

eval "$@"
