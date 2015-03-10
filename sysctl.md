#sysctl

## too many TIME_WAIT

```

# echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
or
add net.ipv4.tcp_tw_recycle = 1 to /etc/sysctl.conf .

```

REF: <https://engineering.gosquared.com/optimising-nginx-node-js-and-networking-for-heavy-workloads>


* ERROR LOG : `nf_conntrack: table full, dropping packet`


```

net.ipv4.netfilter.ip_conntrack_max = 655350
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 1200


如果在执行sysctl -p 时提示错误 unknown key，那么表示内核版本比较高，参数名称已经改为

net.netfilter.nf_conntrack_max = 655350
net.netfilter.nf_conntrack_tcp_timeout_established = 1200


OR

echo 256000 > /proc/sys/net/netfilter/nf_conntrack_max

```

* 查看目前 ip_conntrack 配置的值

```
cat /proc/sys/net/ipv4/ip_conntrack_max
cat /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established

```

* 查看目前 ip_conntrack buffer 的使用状况

```
> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_count
> grep ip_conntrack /proc/slabinfo
ip_conntrack       38358  64324    304   13    1 : tunables   54   27    8 : slabdata   4948   4948    216

```

* 其中各个数字的含义为：

```
38358 the number of currently active objects
64324 the total number of available objects
  304 the size of each object in bytes
   13 the number of pages with at least one active object
```


* 查出目前 ip_conntrack 记录最多的前十名 IP

```
 cat /proc/net/ip_conntrack | cut -d ' ' -f 10 | cut -d '=' -f 2 | sort | uniq -c | sort -nr | head -n 10
# 结果示例
#   6801 127.0.0.1
#   3993 122.224.190.62
#   1101 183.28.42.100
#   1004 222.73.254.95
#    549 120.42.98.143
#    483 114.135.81.206
#    460 123.154.46.196
#    431 222.242.121.122
#    410 125.33.21.174
#    312 222.211.218.59
```



* REFER: <http://blog.yorkgu.me/2012/02/09/kernel-nf_conntrack-table-full-dropping-packet/>




## f5

```
# Kernel sysctl configuration file for F5 BIG-IP
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.

# Controls IP packet forwarding
net.ipv4.ip_forward = 0

# Controls responses to ARP requests
# Do not respond to ARPs if the route to the originator does not
# egress via the interface on which the request was received
net.ipv4.conf.all.arp_filter = 1
# Respond only to ARP requests for addresses configured on the interface
# on which the request was received and only to requests originating
# from directly connected hosts
net.ipv4.conf.all.arp_ignore = 2

# Controls ARP request source IP address selection
net.ipv4.conf.all.arp_announce = 1

# Controls source route verification
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 0
net.ipv6.conf.all.rp_filter = 1
net.ipv6.conf.default.rp_filter = 0

# Promote secondary IPv4 addresses if the primary is deleted
net.ipv4.conf.default.promote_secondaries = 1
net.ipv4.conf.all.promote_secondaries = 1

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0

# Controls the System Request debugging functionality of the kernel
kernel.sysrq = 0

# Controls tcp timestamps
net.ipv4.tcp_timestamps = 1

# Controls the use of TCP syncookies
net.ipv4.tcp_syncookies = 1

# Controls the maximum size of a message, in bytes
kernel.msgmnb = 65536

# Controls whether core dumps will append the PID to the core filename.
# Useful for debugging multi-threaded applications.
# this is now taken care of in /etc/sysconfig/sysinit
#kernel.core_uses_pid = 0
#kernel.core_pattern = /var/core/%e.core

# Controls the default maxmimum size of a mesage queue
kernel.msgmax = 65536

# Controls the maximum shared segment size, in bytes
kernel.shmmax = 4294967295

# Controls the maximum number of shared memory segments, in pages
kernel.shmall = 268435456

# Controls the inotify queue size (default 16384)
fs.inotify.max_queued_events = 32768

# Deactivate IPv6 auto configuration.
net.ipv6.conf.default.autoconf = 0
net.ipv6.conf.all.autoconf = 0
net.ipv6.conf.eth0.autoconf = 0
net.ipv6.conf.lo.autoconf = 0

# Disable IPv6 DAD.
net.ipv6.conf.all.dad_transmits=0
net.ipv6.conf.all.accept_dad=0
net.ipv6.conf.default.dad_transmits=0
net.ipv6.conf.default.accept_dad=0

#
# Don't send IPv6 router solicitations and do not accept advertisements.
#
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.router_solicitations = 0
net.ipv6.conf.default.router_solicitations = 0
net.ipv6.conf.eth0.accept_ra = 0
net.ipv6.conf.lo.accept_ra = 0

#
# Increase maximum socket buffer size for NETLINK sockets
# (this is the maximum application may ask for, not the default
#  size)
#
net.core.rmem_max = 1048576
net.core.wmem_max = 1048576

# Limit aggressiveness of page frame reclaim in favour of less disk I/O
vm.swappiness = 10

# Switch to legacy memory layout to allow libhugetlbfs to do it's dirty tricks
vm.legacy_va_layout = 1
```




## sample

```
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 0
net.ipv4.ip_local_port_range = 1024  65535
net.ipv4.tcp_max_tw_buckets = 10000
net.ipv4.netfilter.ip_conntrack_max = 1024000
```

* REFER <http://huoding.com/2013/12/31/316>
