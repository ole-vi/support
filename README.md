### Before running the script
- install [jq](https://stedolan.github.io/jq/download/) package

### How to run

```
./automation.sh
./automation_source.sh
#It will generate diff file
```

### How to set a time-based job using crontab
```
#if you want to change the default editor
export EDITOR=vim
#add job at the bottom
crontab -e
#example: run auto.sh every hour
-----------------
SHELL=/bin/bash
0 * * * * auto.sh
-----------------
```