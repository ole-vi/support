#!/bin/bash

set -e

# set username and password
if [[ -z "${UNAME}" ]]; then
   echo "UNAME env variable not found, please add it first."
   exit 1
fi

if [[ -z "${UPASS}" ]]; then
   echo "UPASS env variable not found, please add it first."
   exit 1
fi

# get token to be able to talk to Docker Hub
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${UNAME}'", "password": "'${UPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
#echo $TOKEN

# get list of repos for that user account
#REPO_LIST=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${UNAME}/?page_size=10000 | jq -r '.results|.[]|.name')
REPO_LIST=(alpine nginx nginx-tags webssh webssh-tags novnc novnc-tags turtleblocksjs turtleblocksjs-tags musicblocks musicblocks-tags node)

# build a list of all images & tags
for i in ${REPO_LIST[@]}
do
  # get tags for repo
  IMAGE_TAGS=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/treehouses/${i}/tags/?page_size=9 | jq -r '.results|.[]|.name')

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