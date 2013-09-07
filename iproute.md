#iproute

##dynamic route for another gateway 

```

echo 200 isp2 >> /etc/iproute2/rt_tables
ip route flush table cnc
ip route add default via 192.168.1.1 dev eth0 table cnc
ip rule add from 192.168.1.2 table cnc

ip route flush table isp1
ip route add default via 192.168.1.12 dev eth1 table tel
ip rule add from 192.168.1.101 table tel


ip route add 192.168.1.200 netmask 255.255.255.0

```
* change gateway

`ip route add default via 192.168.1.1 dev eth0 table cnc`


* <http://unix.stackexchange.com/questions/4420/reply-on-same-interface-as-incoming>
* <http://www.cnblogs.com/JemBai/archive/2011/10/13/2210560.html>