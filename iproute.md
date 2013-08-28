#iproute

##dynamic route for another gateway 

```

echo 200 isp2 >> /etc/iproute2/rt_tables
ip route add default via 192.168.1.1 dev eth0 table cnc
ip rule add from 192.168.1.2 table cnc

```