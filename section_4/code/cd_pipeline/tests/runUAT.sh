#!/bin/bash

# set variables
hostname='app_dev'
port=$1

# wait for the app to start
sleep 5 

# ping the app
status_code=$(curl -I -s -w "%{http_code}" ${hostname}:${port})
echo $status_code

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
