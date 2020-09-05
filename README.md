### Before running the script
- set up environment variable `export UNAME=<docker username>`
- set up environment variable `export UPASS=<docker apikey/password>`
- install [jq](https://stedolan.github.io/jq/download/) package

### How to run

```
./monitor_dockerhub.sh > <date>.diff

#after serveral days...
diff 20200904.diff 20200831.diff | grep "<"
```