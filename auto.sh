DIR="/home/pi/fky/support/"
cd $DIR

./automation.sh
./automation_source.sh
sync;sync;sync
treehouses feedback Docker_hub:$(<log.diff)
treehouses feedback Source:$(<log_source.diff)
