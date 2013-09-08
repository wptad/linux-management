#iproute


###ip route

* Viewing the main routing table with ip route show

```
[root@tristan]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.99.0    0.0.0.0         255.255.255.0   U     0      0        0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         192.168.99.254  0.0.0.0         UG    0      0        0 eth0
[root@tristan]# ip route show
192.168.99.0/24 dev eth0  scope link 
127.0.0.0/8 dev lo  scope link 
default via 192.168.99.254 dev eth0

```


* Viewing the local routing table with ip route show table local

```

[root@tristan]# ip route show table local
local 192.168.99.35 dev eth0  proto kernel  scope host  src 192.168.99.35 
broadcast 127.255.255.255 dev lo  proto kernel  scope link  src 127.0.0.1 
broadcast 192.168.99.255 dev eth0  proto kernel  scope link  src 192.168.99.35 
broadcast 127.0.0.0 dev lo  proto kernel  scope link  src 127.0.0.1 
local 127.0.0.1 dev lo  proto kernel  scope host  src 127.0.0.1 
local 127.0.0.0/8 dev lo  proto kernel  scope host  src 127.0.0.1

```
* Viewing a routing table with ip route show table

```

[root@tristan]# ip route show table special
Error: argument "special" is wrong: table id value is invalid

[root@tristan]# echo 7 special >> /etc/iproute2/rt_tables
[root@tristan]# ip route show table special
[root@tristan]# ip route add table special default via 192.168.99.254
[root@tristan]# ip route show table special
default via 192.168.99.254 dev eth0
```
* Displaying the routing cache with ip route show cache

```

[root@tristan]# ip route show cache 192.168.100.17
192.168.100.17 from 192.168.99.35 via 192.168.99.254 dev eth0 
    cache  mtu 1500 rtt 18ms rttvar 15ms cwnd 15 advmss 1460
192.168.100.17 via 192.168.99.254 dev eth0  src 192.168.99.35 
    cache  mtu 1500 advmss 1460
    
```
* Displaying statistics from the routing cache with ip -s route show cache

```

[root@tristan]# ip -s route show cache 192.168.100.17
192.168.100.17 from 192.168.99.35 via 192.168.99.254 dev eth0 
    cache  users 1 used 326 age 12sec mtu 1500 rtt 72ms rttvar 22ms cwnd 2 advmss 1460
192.168.100.17 via 192.168.99.254 dev eth0  src 192.168.99.35 
    cache  users 1 used 326 age 12sec mtu 1500 advmss 1460
```

* Adding a static route to a network with route add

```
[root@masq-gw]# ip route add 10.38.0.0/16 via 192.168.100.1

```

* Adding a prohibit route with route add

```

[root@masq-gw]# ip route add prohibit 209.10.26.51
[root@tristan]# ssh 209.10.26.51
ssh: connect to address 209.10.26.51 port 22: No route to host
[root@masq-gw]# tcpdump -nnq -i eth2
tcpdump: listening on eth2
22:13:13.740406 192.168.99.35.51973 > 209.10.26.51.22: tcp 0 (DF)
22:13:13.740714 192.168.99.254 > 192.168.99.35: icmp: host 209.10.26.51 unreachable - admin prohibited filter [tos 0xc0]
```          
* Using from in a routing command with route add

```
[root@masq-gw]# ip route add prohibit 209.10.26.51 from 192.168.99.35

```
*Using src in a routing command with route add

```
[root@masq-gw]# ip route add default via 205.254.211.254 src 205.254.211.198 table 7
```

*  Setting the default route with ip route add default

```
[root@tristan]# ip route add default via 192.168.99.254

```
* Creating a NAT route for a single IP with ip route add nat

```
[root@masq-gw]# ip route add nat 205.254.211.17 via 192.168.100.17
[root@masq-gw]# ip route show table local | grep ^nat
nat 205.254.211.17 via 192.168.100.17  scope host
          
```

* Creating a NAT route for an entire network with ip route add nat

```

[root@masq-gw]# ip route add nat 205.254.211.32/29 via 192.168.100.32
[root@masq-gw]# ip route show table local | grep ^nat
nat 205.254.211.32/29 via 192.168.100.32  scope host
          
```
* Removing routes with ip route del

```
[root@masq-gw]# ip route show
192.168.100.0/30 dev eth3  scope link
205.254.211.0/24 dev eth1  scope link
192.168.100.0/24 dev eth0  scope link
192.168.99.0/24 dev eth0  scope link
192.168.98.0/24 via 192.168.99.1 dev eth0
10.38.0.0/16 via 192.168.100.1 dev eth3
127.0.0.0/8 dev lo  scope link 
default via 205.254.211.254 dev eth1
[root@masq-gw]# ip route del 10.38.0.0/16 via 192.168.100.1 dev eth3
          
```

* Altering existing routes with ip route change

```

[root@tristan]# ip route change default via 192.168.99.113 dev eth0
[root@tristan]# ip route show
192.168.99.0/24 dev eth0  scope link 
127.0.0.0/8 dev lo  scope link 
default via 192.168.99.113 dev eth0
```

*  Testing routing tables with ip route get

```

[root@tristan]# ip -s route get 127.0.0.1/32
ip -s route get 127.0.0.1/32
local 127.0.0.1 dev lo  src 127.0.0.1 
    cache <local>  users 1 used 1 mtu 16436 advmss 16396
[root@tristan]# ip -s route get 127.0.0.1/32
local 127.0.0.1 dev lo  src 127.0.0.1 
    cache <local>  users 1 used 2 mtu 16436 advmss 16396
```

* Removing a specific route and emptying a routing table with ip route flush

```
[root@masq-gw]# ip route flush
"ip route flush" requires arguments
[root@masq-gw]# ip route flush 10.38
Nothing to flush.
[root@masq-gw]# ip route flush 10.38.0.0/16
[root@masq-gw]# ip route show
192.168.100.0/30 dev eth3  scope link
205.254.211.0/24 dev eth1  scope link
192.168.100.0/24 dev eth0  scope link
192.168.99.0/24 dev eth0  scope link
192.168.98.0/24 via 192.168.99.1 dev eth0
127.0.0.0/8 dev lo  scope link 
default via 205.254.211.254 dev eth1
[root@masq-gw]# ip route flush table main
[root@masq-gw]# ip route show
[root@masq-gw]# 
          
```
* Emptying the routing cache with ip route flush cache

```

[root@tristan]# ip route show cache
local 127.0.0.1 from 127.0.0.1 tos 0x10 dev lo 
    cache <local>  mtu 16436 advmss 16396
local 127.0.0.1 from 127.0.0.1 dev lo 
    cache <local>  mtu 16436 advmss 16396
192.168.100.17 from 192.168.99.35 via 192.168.99.254 dev eth0 
    cache  mtu 1500 rtt 18ms rttvar 15ms cwnd 15 advmss 1460
192.168.100.17 via 192.168.99.254 dev eth0  src 192.168.99.35 
    cache  mtu 1500 advmss 1460
[root@tristan]# ip route flush cache
[root@tristan]# ip route show cache
[root@tristan]# ip route show cache
local 127.0.0.1 from 127.0.0.1 tos 0x10 dev lo 
    cache <local>  mtu 16436 advmss 16396
local 127.0.0.1 from 127.0.0.1 dev lo 
    cache <local>  mtu 16436 advmss 16396
          
```


### ip rule

*  Displaying the RPDB with ip rule show

```
[root@isolde]# ip rule show
0:      from all lookup local 
32766:  from all lookup main 
32767:  from all lookup 253
```

* Creating a simple entry in the RPDB with ip rule add

```
[root@masq-gw]# ip route add default via 205.254.211.254 table 8
[root@masq-gw]# ip rule add tos 0x08 table 8
[root@masq-gw]# ip route flush cache
[root@masq-gw]# ip rule show
0:      from all lookup local 
32765:  from all tos 0x08 lookup 8 
32766:  from all lookup main 
32767:  from all lookup 253
          
```

*  Creating a complex entry in the RPDB with ip rule add

```
[root@masq-gw]# ip rule add from 192.168.100.17 tos 0x08 fwmark 4 table 7

```
* Creating a NAT rule with ip rule add nat

```

[root@masq-gw]# ip rule add nat 205.254.211.17 from 192.168.100.17
[root@masq-gw]# ip rule show
0:      from all lookup local 
32765:  from 192.168.100.17 lookup main map-to 205.254.211.17
32766:  from all lookup main 
32767:  from all lookup 253
          
```
*  Creating a NAT rule for an entire network with ip rule add nat

```
[root@masq-gw]# ip rule add nat 205.254.211.32 from 192.168.100.32/29
[root@masq-gw]# ip rule show
0:      from all lookup local 
32765:  from 192.168.100.32/29 lookup main map-to 205.254.211.32
32766:  from all lookup main 
32767:  from all lookup 253
          
```
* Removing a NAT rule for an entire network with ip rule del nat

```
[root@masq-gw]# ip rule del nat 205.254.211.32 from 192.168.100.32/29
[root@masq-gw]# ip rule show
0:      from all lookup local 
32766:  from all lookup main 
32767:  from all lookup 253
```



## list routing tables

```
list the routing tables

$ netstat -rn
Kernel IP routing table
Destination  Gateway         Genmask         Flags   MSS Window  irtt Iface
192.168.2.0  0.0.0.0         255.255.255.0   U         0 0        0    eth0
169.254.0.0  0.0.0.0         255.255.0.0     U         0 0        0    eth0
0.0.0.0      192.168.2.1     0.0.0.0         UG        0 0        0    eth0
```


The output provides a detailed information in the destination IP addresses and their gateways. The flag ‘U’ suggests that the route is up and the flag ‘G’ suggests that the router is to a gateway (router). If this flag is not set then it can be assumed that the destination is directly connected.* 

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

* Reference: <http://linux-ip.net/html/tools-ip-route.html>
* <http://unix.stackexchange.com/questions/4420/reply-on-same-interface-as-incoming>
* <http://www.cnblogs.com/JemBai/archive/2011/10/13/2210560.html>
* <http://hi.baidu.com/cwbdde/item/5092493c0d7bd9fdde222181>