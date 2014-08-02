#sysctl


```
nf_conntrack: table full, dropping packet

```

```
echo 256000 > /proc/sys/net/netfilter/nf_conntrack_max

OR

echo "net.netfilter.nf_conntrack_max = 256000" >> /etc/sysctl.conf
sysctl -p

```




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