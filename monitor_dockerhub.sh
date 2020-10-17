#!/bin/bash

set -e

# get list of repos for that user account
#REPO_LIST=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${UNAME}/?page_size=10000 | jq -r '.results|.[]|.name')
REPO_LIST=(alpine debian nginx nginx-tags webssh webssh-tags novnc novnc-tags turtleblocksjs turtleblocksjs-tags musicblocks musicblocks-tags sysmon sysmon-tags node node-tags apache apache-tags)

# build a list of all images & tags
for i in "${REPO_LIST[@]}"
do
  # get tags for repo
  IMAGE_TAGS=$(curl -s https://hub.docker.com/v2/repositories/treehouses/${i}/tags/?page_size=6 | jq -r '.results|.[]|.name')

  LATEST_UPDATE_TIME=$(curl -s https://hub.docker.com/v2/repositories/treehouses/${i}/tags/latest | jq -r '.last_updated')
  FULL_IMAGE_LIST="${FULL_IMAGE_LIST} $LATEST_UPDATE_TIME"
  # build a list of images from tags
  for j in ${IMAGE_TAGS}
  do
    # add each tag to list
    FULL_IMAGE_LIST="${FULL_IMAGE_LIST} treehouses/${i}:${j}"
  done
  FULL_IMAGE_LIST="${FULL_IMAGE_LIST} --------------------------------------"
done

# output list of all docker images
echo "--------------------------------------"
for i in ${FULL_IMAGE_LIST}
do
  echo ${i}
done
