DIR=`pwd`
cd $DIR

./automation.sh
./automation_source.sh
sync;sync;sync

if [[ -s ./log.diff ]]; then
  treehouses feedback Docker_hub:'```'$(<log.diff)' ```'
else
  echo "No changes of docker hub repositories since last time"
fi

if [[ -s ./log_source.diff ]]; then
  treehouses feedback Source:'```'$(<log_source.diff)' ```'
else
  echo "No changes of sources since last time"	
fi
