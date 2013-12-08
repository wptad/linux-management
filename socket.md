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