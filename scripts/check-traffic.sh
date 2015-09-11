#!/bin/bash

INTERVAL="1"  # update interval in seconds

if [ -z "$1" ]; then
	IF="enp3s0f0"
else
	IF=$1
fi

echo "Start Monitor ${IF}"
while true
do
        R1=`cat /sys/class/net/${IF}/statistics/rx_bytes`
        T1=`cat /sys/class/net/${IF}/statistics/tx_bytes`
        sleep $INTERVAL
        R2=`cat /sys/class/net/${IF}/statistics/rx_bytes`
        T2=`cat /sys/class/net/${IF}/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TKBPS=`expr $TBPS / 131072`
        RKBPS=`expr $RBPS / 131072`
        echo "TX ${IF}: $TKBPS Mb/s RX ${IF}: $RKBPS Mb/s"
done
