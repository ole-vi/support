#! /bin/bash

DIR="/home/pi/support/"

$DIR/automation.sh
$DIR/automation_source.sh
treehouses feedback Docker_hub:$(<$DIR/log.diff)
treehouses feedback Source:$(<$DIR/log_source.diff)
