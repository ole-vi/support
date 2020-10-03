#! /bin/bash

echo "Finding changes since last time..."
if [[ ! -f ./new_source ]]; then
  ./check_sources.sh > new_source
  cat ./new_source
  echo "No old history available"
  exit 0
fi

mv new_source old_source
./check_sources.sh > new_source
diff new_source old_source | grep "<" > log_source.diff

if [[ ! -s ./log_source.diff ]]; then
  echo "No changes since last time"
else
  cat ./log_source.diff
fi
