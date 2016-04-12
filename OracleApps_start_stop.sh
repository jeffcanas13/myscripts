#!/bin/bash
### BEGIN INIT INFO
# Provides:        OracleApps [oraapps]
# Required-Start:  $network
# Required-Stop:   $network
# Default-Start:   2 3 4 5
# Default-Stop:    0 1 6
# Short-Description: Start/Stop OracleApps server
# Scripts Location of start/stop on /u01/scripts
# Last rename this file to oraapps and put in the script location
# Copy the oraapps in /usr/sbin & /usr/bin 
# Run this command 
# oraapps start/stop/restart
### END INIT INFO
PATH=/sbin:/bin:/usr/sbin:/usr/bin
USER=oraapps
start() {
  /bin/su - $USER -c /u01/scripts/startup.sh
}

stop() {
  /bin/su - $USER -c /u01/scripts/shutdown.sh 
}
case $1 in
  start|stop) $1;;
  restart) stop; start;;
  *) echo "Run as $0 <start|stop|restart>"; exit 1;;
esac
EOF