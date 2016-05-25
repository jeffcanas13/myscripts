#!/bin/bash
# Created By: JeFfReYCaNaS, System Administrator
# Server Status Script
# Version 0.1.3 m
# Updated: Jan. 31, 2012

HOSTNAME=`echo "$(hostname)"
CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)
UP=$(echo `uptime` | awk '{ print $3 " " $4 }')
OSVERSION=$(if ( -f /etc/redhat-release ) ; then echo "`cat /etc/redhat-release`" ; else echo "`cat /etc/os-release |grep PRETTY_NAME|awk '{ print substr( $0,13,100 ) }'`"
#function os_version () {    
#    if ( -f /etc/redhat-release )
#    then echo "`cat /etc/redhat-release`"
#    else echo "`cat /etc/os-release |grep PRETTY_NAME|awk '{ print substr( $0,13,100 ) }'`"
#    fi
#    }
#Start of the status line#
echo "
System Status
Updated: `date`
You are using $HOSTNAME!!!
Please be carefull on what you configure here!!!
By: JSCANAS, SYSAD
======================================================
- Server Name               = `hostname`
- OS Version                = `echo $OSVERSION`
- Load Averages             = `cat /proc/loadavg`
- System Uptime             = `echo $UP`
- Platform Data             = `uname -orpi`
- CPU Usage (average)       = `echo $CPUTIME / $CPUCORES | bc`%
- Memory free (real)        = `free -m | head -n 2 | tail -n 1 | awk {'print $4'}` Mb
- Memory free (cache)       = `free -m | head -n 3 | tail -n 1 | awk {'print $3'}` Mb
- Memory Capacity 	        = `free -m | head -n 2 | tail -n 1 | awk {'print $2'}` Mb
- Memory Capacity 	        = `free -m | head -n 2 | tail -n 1 | awk {'print $2'}` Mb
- Swap in use               = `free -m | tail -n 1 | awk {'print $3'}` Mb
- Disk Space Used in /      = `df -h / | awk '{ a = $4 } END { print a }'`
- Disk Space Used in /erpp/erppdata = `df -h /erpp/erppdata/ | awk '{ a = $4 } END { print a }'`
-IP Address                 = `/sbin/ifconfig |grep 'inet addr' | grep -v '127.0.0.1' | awk '{ print $2 }' | awk -F: ' { print $2 }'`
======================================================
" > /etc/motd
