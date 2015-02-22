# L2TP


## Install openswan

```
 apt-get  install openswan  
 
```

* 安装过程中如问到: Use an X.509 certificate for this host, 回答NO.

### 配置sysctl参数

```

sudo mv /etc/sysctl.conf /etc/sysctl.conf.bak
sudo vim /etc/sysctl.conf
-----------输入如下内容-------------
net.ipv4.ip_forward = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0  
```

###加载sysctl参数

```
sysctl  -p
sudo bash -c 'for each in /proc/sys/net/ipv4/conf/*
do
    echo 0 > $each/accept_redirects
    echo 0 > $each/send_redirects
done
```


### 生成iptables配置

```
sudo mv  /etc/rc.local /etc/rc.local.bak
sudo vim /etc/rc.local
-----------输入如下内容-------------
#!/bin/sh -e
iptables -t nat -A POSTROUTING -s 10.1.1.0/24 -o eth0 -j MASQUERADE
exit 0
 
#添加执行权限，运行配置
sudo chmod +x /etc/rc.local
sudo /etc/rc.local
```


###  配置ipsec.secrets

```
sudo mv /etc/ipsec.secrets  /etc/ipsec.secrets.bak
sudo vim /etc/ipsec.secrets
-----------输入如下内容-------------
    # 将IP和密码换成服务器IP和设定的密码 
111.222.333.444 %any: PSK "0123456" 
	#此处密码为服务器的共享密钥，连接时时提供

```



### 配置ipsec.conf
 
```
    sudo mv   /etc/ipsec.conf /etc/ipsec.conf.bak
    sudo vim  /etc/ipsec.conf
    -----------输入如下内容-------------
    version 2.0
    config setup
        nat_traversal=yes
        virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12
        oe=off
        protostack=netkey
     
    conn L2TP-PSK-NAT
        rightsubnet=vhost:%priv
        also=L2TP-PSK-noNAT
     
    conn L2TP-PSK-noNAT
        authby=secret
        pfs=no
        auto=add
        keyingtries=3
        rekey=no
        ikelifetime=8h
        keylife=1h
        type=transport
        left=111.222.333.444 #换成服务器ip
        leftprotoport=17/1701
        right=%any
        rightprotoport=17/%any
```

### 激活ipsec服务
 
```
   sudo update-rc.d ipsec defaults
```

##安装xl2tpd
   
```
   sudo apt-get install xl2tpd
```


### 配置xl2tpd.conf

```
   sudo mv   /etc/xl2tpd/xl2tpd.conf  /etc/xl2tpd/xl2tpd.conf.bak
    sudo vim /etc/xl2tpd/xl2tpd.conf
    -----------输入如下内容-------------
    [global]
    ipsec saref = yes
     
    [lns default]
    ip range = 10.1.1.2-10.1.1.255
    local ip = 10.1.1.1
    refuse chap = yes
    refuse pap = yes
    require authentication = yes
    ppp debug = yes
    pppoptfile = /etc/ppp/options.xl2tpd
    length bit = yes
```

### 配置options.xl2tpd

```
   sudo mv /etc/ppp/options.xl2tpd /etc/ppp/options.xl2tpd.bak
    sudo vim /etc/ppp/options.xl2tpd
    -----------输入如下内容-------------
    require-mschap-v2
    ms-dns 8.8.8.8
    ms-dns 8.8.4.4
    asyncmap 0
    auth
    crtscts
    lock
    hide-password
    modem
    debug
    name l2tpd
    proxyarp
    lcp-echo-interval 30
    lcp-echo-failure 4
```

### 配置chap-secrets

```
    sudo mv   /etc/ppp/chap-secrets  /etc/ppp/chap-secrets.bak
    sudo vim  /etc/ppp/chap-secrets
    -----------输入如下内容-------------
    #user   server  password    ip
    user1   l2tpd   123456      *
    user2   l2tpd   123456      *
```


### 启动L2TP服务器
 
```
    sudo invoke-rc.d xl2tpd restart
    sudo invoke-rc.d ipsec restart
    
```

### 验证服务器状态

``` 
   sudo ipsec verify      
```

```
    出现如下信息：
    Checking your system to see if IPsec got installed and started correctly:
    Version check and ipsec on-path                                  [OK]
    Linux Openswan U2.6.28/K2.6.32.16-linode28 (netkey)
    Checking for IPsec support in kernel                             [OK]
    NETKEY detected, testing for disabled ICMP send_redirects        [OK]
    NETKEY detected, testing for disabled ICMP accept_redirects      [OK]
    Checking that pluto is running                                   [OK]
    Pluto listening for IKE on udp 500                               [OK]
    Pluto listening for NAT-T on udp 4500                            [OK]
    Two or more interfaces found, checking IP forwarding             [OK]
    Checking NAT and MASQUERADEing                              
    Checking for 'ip' command                                        [OK]
    Checking for 'iptables' command                                  [OK]
    Opportunistic Encryption Support                                [DISABLED]
```

* <http://blog.csdn.net/sonsie007/article/details/16932017>
* <http://riobard.com/2010/04/30/l2tp-over-ipsec-ubuntu/>
* <http://blog.hellosa.org/2011/09/25/howto-config-l2tp-vpn-linode-gentoo.html>

### iptables

```
iptables -t nat -A POSTROUTING -o eth4 -s 10.1.1.0/24 -j MASQUERADE
```

### troubleshort

```
Oct 17 02:27:51 lewifi pluto[16638]: "L2TP-PSK-NAT"[1] 118.244.190.40 #1: message ignored because it contains an unknown or unexpected payload type (ISAKMP_NEXT_SAK) at the outermost level
Oct 17 02:27:51 lewifi pluto[16638]: "L2TP-PSK-NAT"[1] 118.244.190.40 #1: sending notification INVALID_PAYLOAD_TYPE to 118.244.190.40:5251




http://superuser.com/questions/740545/l2tp-ipsec-stopped-working-after-openssl-upgrade


apt-get install openswan=1:2.6.37-3


```

* mac

```
* send all traffic √
```


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

## openvpn conf

```
client
dev tun
proto udp
remote 211.11.11.11 1194
resolv-retry infinite
nobind
persist-key
persist-tun
ca ca.crt
cert tad.crt
key tad.key
comp-lzo
verb 3
## redirect all traffic
redirect-gateway

```

# L2TP

* [ CentOS Linux VPS安装IPSec+L2TP VPN]<http://www.live-in.org/archives/818.html>
