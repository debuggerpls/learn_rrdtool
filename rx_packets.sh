#! /bin/bash

DIR=/home/deividas/projects/learn_rrdtool
NET_IF=enp4s0

VALUE=$(cat /sys/class/net/${NET_IF}/statistics/rx_packets)
rrdtool update ${DIR}/rx_packets.rrd N:${VALUE}
echo rrdtool update ${DIR}/rx_packets.rrd N:${VALUE} >> /home/deividas/cron.log