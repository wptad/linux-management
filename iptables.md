#iptables


## check MASQUERADE

```
/> iptables -vnL -tnat

Chain PREROUTING (policy ACCEPT 1796 packets, 149K bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:27017 to:192.168.100.6:27017
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:6379 to:192.168.100.2:6379
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:1101 to:192.168.100.2:1101
  111  6676 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:1100 to:192.168.100.2:1100
 2670  160K DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:1099 to:192.168.100.2:1099
 
 
```


```
/> iptables -vnL

Chain INPUT (policy ACCEPT 32255 packets, 6416K bytes)
 pkts bytes target     prot opt in     out     source               destination         
  496 58016 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 31224 packets, 5577K bytes)
 pkts bytes target     prot opt in     out     source               destination     


```
## port forward

```
iptables -t nat -I PREROUTING -p tcp --dport 27017 -j DNAT --to 192.168.100.2:27017
```

* <https://www.frozentux.net/iptables-tutorial/cn/iptables-tutorial-cn-1.1.19.html>
* <http://serverfault.com/questions/140622/how-can-i-port-forward-with-iptables>
* <http://www.wangjia.net/bo-blog/how-to-make-port-forward-by-iptables/>


## iptable structure

* <http://www.iptables.info/en/structure-of-iptables.html>

