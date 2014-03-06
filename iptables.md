#iptables


## port forward

```
iptables -t nat -I PREROUTING -p tcp --dport 27017 -j DNAT --to 192.168.100.2:27017
```

* <https://www.frozentux.net/iptables-tutorial/cn/iptables-tutorial-cn-1.1.19.html>
* <http://serverfault.com/questions/140622/how-can-i-port-forward-with-iptables>
* <http://www.wangjia.net/bo-blog/how-to-make-port-forward-by-iptables/>
