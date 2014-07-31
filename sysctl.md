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