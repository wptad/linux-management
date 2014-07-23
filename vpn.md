#open vpn


```

sudo apt-get install openssl openvpn

cp -R /usr/share/doc/openvpn/examples/easy-rsa /etc/openvpn
cd /etc/openvpn/easy-rsa/2.0

```

* EDIT: vars, change environment, at the bottom

```
sudo nano vars

```

## build ca

```
. ./vars   #OR source ./vars

./clean-all 
./build-ca
```
##build server keys

```
./build-key-server server
```

##build client keys

```
./build-key client1
```

##generate Diffie Hellman paramaters

```
./build-dh
```

##Placing the Server Keys and Creating Server Config

* in keys folder
```
cd keys
cp ca.crt ca.key dh1024.pem server.crt server.key /etc/openvpn
```

```
sudo nano /etc/openvpn/openvpn.conf

```
* openvpn.conf

```
client-config-dir ccd
push "route 192.168.1.0 255.255.255.0"  // router internal network
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

## start service

```
/etc/init.d/openvpn start
```

## get client files

```
client.crt
client.key
ca.crt
config.ovpn
```

* client configure file

```
client
dev tun
proto udp
remote 10.10.11.200 1194
resolv-retry infinite
nobind
persist-key
persist-tun
ca ca.crt
cert tad_office_router.crt
key tad_office_router.key
comp-lzo
verb 3

```

Reference: <http://aproductivelife.blogspot.jp/2010/03/tutorial-on-how-to-setup-openvpn-server.html>

* <https://forums.openvpn.net/topic8406.html>
* <http://blog.remibergsma.com/2013/01/05/building-an-economical-openvpn-server-using-the-raspberry-pi/>



* iptables

```
iptables -t nat -A POSTROUTING -s 172.17.0.0/24 -o eth1 -j MASQUERADE
iptables -A FORWARD -s 172.17.0.0/24 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o tun0 -m state --state ESTABLISHED,RELATED -j ACCEPT
```


#PPTP


```
apt-get install pptpd -y
update-rc.d pptpd defaults
echo "localip 172.20.1.1" >> /etc/pptpd.conf
echo "remoteip 172.20.1.2-254" >> /etc/pptpd.conf
echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options
echo "ms-dns 8.8.4.4" >> /etc/ppp/pptpd-options
echo "tad * password *" >> /etc/ppp/chap-secrets
service pptpd restart
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
iptables -I INPUT -p tcp --dport 1723 -m state --state NEW -j ACCEPT
iptables -I INPUT -p gre -j ACCEPT
iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -s 172.20.1.0/24 -j TCPMSS  --clamp-mss-to-pmtu


iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -s 10.9.8.0/24 -j TCPMSS  --clamp-mss-to-pmtu

```

iptables -t nat -I POSTROUTING -o eth1 -j MASQUERADE




# Auto select route


* <http://code.google.com/p/chnroutes/>



# L2TP

* [ CentOS Linux VPS安装IPSec+L2TP VPN]<http://www.live-in.org/archives/818.html>