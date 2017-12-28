#!/bin/bash

dev_id=$(adb devices | awk '{print $1}')
dev_id=$(echo $dev_id | awk '{print $2}')
echo "device: $dev_id"

ip_addr=$(adb -s $dev_id shell ip route |awk '{print $9}')
echo "ip: $ip_addr"

port=5555
echo "port: $port"
adb -s $dev_id tcpip $port
adb connect $ip_addr:$port