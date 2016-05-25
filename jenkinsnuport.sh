#!/bin/bash
DIR='/etc/default/jenkins'
PORT=`cat $DIR |grep HTTP_PORT=`
echo "Existing JENKINS port $PORT"
echo -n "Type Your New Jenkins Port to be used: "
read NEWPORT
NUPORT=`echo "HTTP_PORT=$NEWPORT"`
#echo $PORT/$NUPORT
sed -i -e 's/$PORT/$NUPORT/g' $DIR
echo "Your new Jenkins port is $PORT"
