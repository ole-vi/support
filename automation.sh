#! /bin/bash

echo "Finding changes since last time..."
if [[ ! -f ./new ]]; then
  ./monitor_dockerhub.sh > new
  echo "No old history available"
  exit 0
fi

mv new old
./monitor_dockerhub.sh > new
diff new old | grep "<" > log.diff

if [[ ! -s ./log.diff ]]; then
  echo "No changes since last time"
else
  cat ./log.diff
fi