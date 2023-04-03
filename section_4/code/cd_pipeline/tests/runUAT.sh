#!/bin/bash

# set variables
hostname='0.0.0.0'
port=$1

# wait for the app to start
sleep 5 

# ping the app
status_code=$(curl -vvvv --write-out %{http_code} --silent -i ${hostname}:${port})
echo $status_code

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
