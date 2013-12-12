# ss

* <http://xikder.blog.51cto.com/1423200/869467> <http://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html>

* `ss src 192.168.1.9:8888 |wc -l`
* `ss dst 192.168.1.9:8888 |wc -l`
* `ss dst 192.168.1.5:http `
* `ss -s`
* `ss -l ` 列出所有打开的网络连接端口
* `ss -t -a ` 显示所有TCP Sockets  
* `ss -pl ` 查看进程使用的socket
* `ss -o state established '( dport = :http or sport = :http )` //显示所有状态为Established的HTTP连接
* `ss -4 state FILTER-NAME-HERE `
* `ss -6 state FILTER-NAME-HERE  `

#netstats



netstat -tuan | grep ':8888' | awk '{arr[$6]++}END{for (i in arr){print i,arr[i]}}'


netstat -tuan | grep ':6903' | awk '{arr[$6]++}END{for (i in arr){print i,arr[i]}}'



#netstat
* check which connection is abnormal

```

netstat -nt | cut -c 40- | cut -d: -f1 | sort | uniq -c | sort -n

OR

amount-port-ip

netstat -nt | cut -d: -f2 | sort | uniq -c | sort -n

```

* check all connection status


```
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' 

TIME_WAIT 5009
FIN_WAIT1 19
ESTABLISHED 3
FIN_WAIT2 2
SYN_RECV 14
CLOSING 146
LAST_ACK 1


netstat -tuan | grep ':9999' | awk '{arr[$6]++}END{for (i in arr){print i,arr[i]}}'

```
