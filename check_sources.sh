#!/bin/bash

set -e

#https://hub.docker.com/v2/repositories/library/alpine/tags/latest
alpine_last_updated=$(curl -s https://hub.docker.com/v2/repositories/library/alpine/tags/latest | jq -r '.last_updated')
alpine_amd64_info=$(curl -s https://hub.docker.com/v2/repositories/library/alpine/tags/latest | jq -r '.images[] | select(.architecture=="amd64") | .digest')
alpine_arm64_info=$(curl -s https://hub.docker.com/v2/repositories/library/alpine/tags/latest | jq -r '.images[] | select(.architecture=="arm64") | .digest') #} | .[]
alpine_arm_info=$(curl -s https://hub.docker.com/v2/repositories/balenalib/raspberry-pi-alpine/tags/latest | jq -r '{time: .last_updated, sha: .images | .[0].digest} | .[]')

OUTPUT="-----------------------------alpine_source-----------------------------"
OUTPUT="$OUTPUT alpine_amd64~last_updated:$alpine_last_updated $alpine_amd64_info"
OUTPUT="$OUTPUT alpine_arm64~last_updated:$alpine_last_updated $alpine_arm64_info"
OUTPUT="$OUTPUT alpine_arm~last_updated:$alpine_arm_info"

for i in ${OUTPUT}
do
  echo ${i}
done
