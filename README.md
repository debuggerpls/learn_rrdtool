### RRDTOOL examples


#### Store received packets from network interface
-----
```
cat /sys/class/net/<network-if>/statistics/rx_packets
```

1. Create RRD file 
```
rrdtool create rx_packets.rrd --step 1m DS:rx_packets:COUNTER:2m:U:U RRA:AVERAGE:0.5:1m:24h RRA:AVERAGE:0.5:1h:30d
```
2. Add packets to rrd file every second. For example: check `rx_packets.sh` could be added to `crontab -e`:
```
# $ crontab -l
# on last line:
* * * * * /home/deividas/projects/learn_rrdtool/rx_packets.sh
```

3. Plot with
```
rrdtool graph speed.png \
        --start -600    \
        DEF:myspeed=rx_packets.rrd:rx_packets:AVERAGE \
        LINE2:myspeed#FF0000
```