# FAI 



## install

* environment 

```
Debian 7.7
FAI 4.2.5

```

* REFER: <http://my.oschina.net/zwj0571/blog/317435>

### faiserver info

```

auto lo
iface lo inet loopback

auto eth0
allow-hotplug eth0
iface eth0 inet static
        address 10.10.11.49
        network 255.255.255.0
        gateway 10.10.11.1
        dns-nameservers 114.114.114.114

auto eth1
allow-hotplug eth1
iface eth1 inet static
        address 192.168.2.1
        network 255.255.255.0

```

### router server (option)

```
echo '1'> /proc/sys/net/ipv4/ip_forward 
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

```

### ntp server(option)

```
apt-get install ntp
```

### DHCP 
* install 


```
apt-get install isc-dhcp-server

```

* `nano /etc/dhcp/dhcpd.conf` 

```
subnet 192.168.2.0 netmask 255.255.255.0 {
   range 192.168.2.100  192.168.2.222;
   option domain-name-servers 114.114.114.114;
   option routers 192.168.2.1;
 #   option time-servers faiserver;
   option ntp-servers 192.168.2.1;
  # server-name servername;
   next-server 192.168.2.1;
   filename "fai/pxelinux.0";
}

```


### TFTP


```
apt-get install tftpd-hpa
```

* `cat /etc/default/tftpd-hpa`

```
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="--secure"
```

### FAI install


* configure the source
* `nano /etc/apt/sources.list` and add the following

```
deb http://fai-project.org/download wheezy koeln

```


```
wget -O - http://fai-project.org/download/074BCDE4.asc | apt-key add -
apt-get update
apt-get install fai-quickstart -y
```

* ` nano /etc/fai/fai.conf `

```
LOGUSER=fai
FAI_CONFIG_SRC=nfs://192.168.2.1/srv/fai/config 
```

* `cat /etc/fai/nfsroot.conf `

```

 # For a detailed description see nfsroot.conf(5)

 # "<suite> <mirror>" for debootstrap
FAI_DEBOOTSTRAP="wheezy http://mirrors.163.com/debian/"
FAI_ROOTPW='$1$kBnWcO.E$djxB128U7dMkrltJHPf6d1'
 # NFSROOT_ETC_HOSTS="192.168.2.1"
NFSROOT=/srv/fai/nfsroot
TFTPROOT=/srv/tftp/fai
NFSROOT_HOOKS=/etc/fai/nfsroot-hooks/
FAI_DEBOOTSTRAP_OPTS="--exclude=info --include=aptitude"
 # Configuration space
FAI_CONFIGDIR=/srv/fai/config

```

* `nano /etc/fai/apt/sources.list`

```
deb http://mirrors.163.com/debian/ wheezy main
deb-src http://mirrors.163.com/debian/ wheezy main

deb http://security.debian.org/ wheezy/updates main
deb-src http://security.debian.org/ wheezy/updates main

deb http://mirrors.163.com/debian/ wheezy-updates main
deb-src http://mirrors.163.com/debian/ wheezy-updates main

```

* make nfsroot and faiconfig files

```
fai-setup -v
```
* after finish

```
   You have no FAI configuration space yet. Copy the simple examples with:
   cp -a /usr/share/doc/fai-doc/examples/simple/* /srv/fai/config
   Then change the configuration files to meet your local needs.

```

*  generate

```
fai-chboot -IBv -u nfs://192.168.2.1/srv/fai/config default
```

* fix nfs problem
* `cat /etc/exports`

```
/srv/nfs4       134.95.9.128/25(fsid=0,ro,no_subtree_check)
/srv/fai/config 192.168.2.1/24(async,ro,no_subtree_check)
/srv/fai/nfsroot 192.168.2.1/24(async,ro,no_subtree_check,no_root_squash)

```


* restart service 

```
/etc/init.d/nfs-common restart
/etc/init.d/isc-dhcp-server restart
/etc/init.d/nfs-kernel-server restart
/etc/init.d/tftpd-hpa restart

```




### how generate password

```
apt-get install  openssl

and then use 
"openssl passwd -1 -salt 'random-phrase-here' 'your-password-here'" 

```


## TODO


* download netboot PXE file
* try run with it
* network interface
* hdd
* passwd
* hostname
* 