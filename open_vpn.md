#open vpn

`sudo apt-get install openssl openvpn`

Reference: <http://aproductivelife.blogspot.jp/2010/03/tutorial-on-how-to-setup-openvpn-server.html>

* <https://forums.openvpn.net/topic8406.html>
* <http://blog.remibergsma.com/2013/01/05/building-an-economical-openvpn-server-using-the-raspberry-pi/>


* openvpn.conf

```
client-config-dir ccd
push "route 192.168.1.0 255.255.255.0"
route 192.168.5.0 255.255.255.0
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh1024.pem
server 172.17.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
keepalive 10 120
comp-lzo
user nobody
group users
persist-key
persist-tun
status openvpn-status.log
verb 3

```
* ccd/client1

```
iroute 192.168.5.0 255.255.255.0

```


* iptables

```
iptables -t nat -A POSTROUTING -s 172.17.0.0/24 -o eth1 -j MASQUERADE
iptables -A FORWARD -s 172.17.0.0/24 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o tun0 -m state --state ESTABLISHED,RELATED -j ACCEPT
```