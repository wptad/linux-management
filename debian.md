#deiban 

## debian Chinese apt source

* aliyun

```
deb http://mirrors.aliyun.com/debian wheezy main contrib non-free
deb-src http://mirrors.aliyun.com/debian wheezy main contrib non-free

deb http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free
deb-src http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free

deb http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free
deb-src http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free

```

* cn

```
deb http://ftp.cn.debian.org/debian wheezy main
deb-src http://ftp.cn.debian.org/debian wheezy main

deb http://ftp.cn.debian.org/debian wheezy-updates main
deb-src http://ftp.cn.debian.org/debian wheezy-updates main

deb http://security.debian.org/ wheezy/updates main
deb-src http://security.debian.org/ wheezy/updates main

```
* <http://xmodulo.com/2013/10/speed-slow-apt-get-install-debian-ubuntu.html>

* <http://backports.debian.org/debian-backports/dists/squeeze-backports/>

## debian Install with SataRaid

* <https://wiki.debian.org/DebianInstaller/SataRaid>

### NetXtreme II 10 Gigabit Driver Downloads

* <http://www.broadcom.com/support/ethernet_nic/netxtremeii10.php>
* <http://www.broadcom.com/support/license.php?file=NXII_10/linux-7.8.56.zip>

##update core

* Add the backports repository to your /etc/apt/sources.list.

```
## DEBIAN
deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free
deb-src http://ftp.us.debian.org/debian/ wheezy main contrib non-free

## DEBIAN-SECURITY
deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free

## DEBIAN-UPDATES 
deb http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free 
deb-src http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free

## DEBIAN-BACKPORTS
deb http://ftp.us.debian.org/debian/ wheezy-backports main contrib non-free
deb-src http://ftp.us.debian.org/debian/ wheezy-backports main contrib non-free
```

OR China site:

```

deb http://mirrors.sohu.com/debian/ wheezy main
deb-src http://mirrors.sohu.com/debian/ wheezy main

deb http://security.debian.org/ wheezy/updates main
deb-src http://security.debian.org/ wheezy/updates main

deb http://mirrors.sohu.com/debian/ wheezy-updates main
deb-src http://mirrors.sohu.com/debian/ wheezy-updates main

deb http://mirrors.sohu.com/debian/ wheezy-backports main
deb-src http://mirrors.sohu.com/debian/ wheezy-backports main

```

*  Determine which kernel and firmware images you have installed.


```
# To track the latest backports kernel image you want the kernel image metapackage.
# It should be something like linux-image-amd64 or linux-image-rt-amd64.
aptitude search linux-image | grep -E '^i'

# You will also need to upgrade the binary firmware to the version from backports.
# This should be something like firmware-linux and firmware-iwlwifi.
aptitude search firmware | grep -E '^i'
```

* Install the latest kernel and firmware images from backports.

```
sudo apt-get update

# Replace the linux-image, linux-headers, and firmware packages below with the ones you have installed.

apt-get install -t wheezy-backports linux-image-3.14-0.bpo.2-amd64 linux-headers-3.14-0.bpo.2-amd64 firmware-linux  firmware-bnx2x

sudo reboot

```




* <http://www.neowin.net/forum/topic/1162482-debian-backport-kernel/>

* <http://www.cnblogs.com/coding-way/archive/2012/01/08/2316221.html>

* Upgrade Debian 6.0 Squeeze to 7.0 Wheezy <http://www.garron.me/en/linux/upgrade-debian-squeeze-wheezy-6.0-7.0.html>


## START WITH TERMINAL


```
// disable GUI
update-rc.d -f gdm3 remove 

// enable GUI
update-rc.d gdm3 defaults 

```
* <http://www.debianadmin.com/howto-boot-debian-in-text-mode-instead-of-graphical-mode-gui.html>

## input 

<http://blog.csdn.net/fallen_devil/article/details/8576334>


## interface setting template

```

auto lo
iface lo inet loopback

allow-hotplug eth0
iface eth0 inet static
        address 192.168.1.3
        netmask 255.255.255.0
        network 192.168.1.0
        broadcast 192.168.1.255
        gateway 192.168.1.1
        # dns-* options are implemented by the resolvconf package, if installed
        dns-nameservers 202.102.227.68
```

Bridge mode

```
auto lo
iface lo inet loopback

auto eth0
allow-hotplug eth0
iface eth0 inet manual
   pre-up   ifconfig $IFACE up
   pre-down ifconfig $IFACE down


auto br0
allow-hotplug br0
iface br0 inet static
	bridge_ports eth0
	address 192.168.100.2
	netmask 255.255.255.0
	gateway 192.168.100.1


```
