DIR="/root/observe"
cd $DIR

./automation.sh
./automation_source.sh
sync;sync;sync

if [[ -s ./log.diff ]]; then
  treehouses feedback Docker:'```'$(<log.diff)' ```'
else
  echo "No changes of docker hub repositories since last time"
fi

if [[ -s ./log_source.diff ]]; then
  treehouses feedback Sources:'```'$(<log_source.diff)' ```'
else
  echo "No changes of sources since last time"	
fi
