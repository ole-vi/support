DIR="/home/pi/fky/support/"
cd $DIR

./automation.sh
./automation_source.sh
sync;sync;sync

if [[ ! -s ./log.diff ]]; then
  treehouses feedback Docker_hub:'```'$(<log.diff)'```'
fi

if [[ ! -s ./log_source.diff ]]; then
treehouses feedback Source:'```'$(<log_source.diff)'```'
fi
