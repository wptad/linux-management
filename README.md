#SSH 

* `ssh -L 3202:192.168.1.202:80 root@11.25.22.13`

* SSH port forwarding: <http://www.ruanyifeng.com/blog/2011/12/ssh_port_forwarding.html>

#umask

* <http://www.cyberciti.biz/tips/understanding-linux-unix-umask-value-usage.html>

* <http://en.wikipedia.org/wiki/Umask>



#sysctl.conf

* File: /etc/sysctl.conf

```
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000 ##已经修改

说明：
　　net.ipv4.tcp_syncookies = 1 表示开启SYN Cookies。当出现SYN等待队列溢出时，启用cookies来处理，可防范少量SYN攻击，默认为0，表示关闭；
　　net.ipv4.tcp_tw_reuse = 1 表示开启重用。允许将TIME-WAIT sockets重新用于新的TCP连接，默认为0，表示关闭；
　　net.ipv4.tcp_tw_recycle = 1 表示开启TCP连接中TIME-WAIT sockets的快速回收，默认为0，表示关闭。
　　net.ipv4.tcp_fin_timeout = 30 表示如果套接字由本端要求关闭，这个参数决定了它保持在FIN-WAIT-2状态的时间。
　　net.ipv4.tcp_keepalive_time = 1200 表示当keepalive起用的时候，TCP发送keepalive消息的频度。缺省是2小时，改为20分钟。
　　net.ipv4.ip_local_port_range = 1024 65000 表示用于向外连接的端口范围。缺省情况下很小：32768到61000，改为1024到65000。
　　net.ipv4.tcp_max_syn_backlog = 8192 表示SYN队列的长度，默认为1024，加大队列长度为8192，可以容纳更多等待连接的网络连接数。
　　net.ipv4.tcp_max_tw_buckets = 5000 表示系统同时保持TIME_WAIT套接字的最大数量，如果超过这个数字，TIME_WAIT套接字将立刻被清除并打印警告信息。默认为180000，改为5000。对于Apache、Nginx等服务器，上几行的参数可以很好地减少TIME_WAIT套接字数量，但是对于Squid，效果却不大。此项参数可以控制TIME_WAIT套接字的最大数量，避免Squid服务器被大量的TIME_WAIT套接字拖死。

```

FROM: <http://www.zhanghaijun.com/post/894/>


#Proxy

```

export http_proxy=http://192.168.88.1:3128/
export ftp_proxy=http://192.168.88.1:3128/

```

#Linux Core Header source

```
aptitude install module-assistant  
m-a prepare
```


#tcpdump 

```
tcpdump -i eth1

tcpdump -i eth2 'port 22'


tcpdump -qnn


```

TCPDump: Capture and Record Specific Protocols / Port

<http://www.cyberciti.biz/faq/tcpdump-capture-record-protocols-port/>
