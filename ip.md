## ip

### command 

* Identify the name of your Ethernet interface.

```
ip link
```

* Activate the connected Ethernet interface (e.g. enp2s0f0):

```
 ip link set enp2s0f0 up
```

* Add the address:

```
ip addr add ip_address/mask_bits dev interface_name

```

For example:

```
ip addr add 192.168.1.2/24 dev enp2s0f0
```

For more options, run man ip.

Add your gateway like this, substituting your own gateway's IP address:

```
ip route add default via ip_address

```

For example:

```
ip route add default via 192.168.1.1

```

Edit `resolv.conf`, substituting your name servers' IP addresses and your local domain name:


```
# nano /etc/resolv.conf
nameserver 61.23.173.5
nameserver 61.95.849.8
search example.com
```