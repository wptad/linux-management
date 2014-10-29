#NIC

## bond

### install

```
apt-get install ifenslave
```

### interface config

```
auto bond0
allow-hotplug bond0
iface bond0 inet static
	address 10.10.10.10
	netmask 255.255.255.0
	gateway 10.10.10.1
	slaves eth0 eth1
	bond_mode balance-alb
	bond_miimon 100
	bond_downdelay 200
	bond_updelay 200
	dns-nameservers 114.114.114.114
```

### check stats

```
cat /proc/net/bonding/bond0 
```



* debian Refer : <https://wiki.debian.org/Bonding>
* Refer: <http://www.enterprisenetworkingplanet.com/linux_unix/article.php/3850636/Understanding-NIC-Bonding-with-Linux.htm>
* Refer: <http://www.2cto.com/os/201403/283742.html>


# install module command
* modinfo MODULE_NAME
* lsmod
* lspci
* lspci -v
* modprobe module
* depmod
* modprobe –v qla4xxx  // load driver
* modprobe –r qla4xxx  // upload driver



*　Rebuild the kernel module dependencies
-> depmod -a
-> insmod ./src/r8168.ko

<https://wiki.archlinux.org/index.php/Kernel_modules#Loading>

# depmod

* <http://blog.chinaunix.net/uid-16330130-id-2747402.html>

#Intel

* Driver <https://downloadcenter.intel.com/Detail_Desc.aspx?agr=Y&DwnldID=15817&lang=zho&OSVersion=Linux*&DownloadType=>
* README: <http://downloadmirror.intel.com/15817/eng/README.txt>



#eth sequence

```
/etc/udev/rules.d/z25_persistent-net.rules

```


# Nic bonding

* Debian Kernel Module Configuration

```
# /etc/modules: kernel modules to load at boot time.
 
bonding mode=4 miimon=100 lacp_rate=1
```

* Debian / Ubuntu Network Setup

```
#/etc/network/interfaces 
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
 
auto bond0
iface bond0 inet static
	address 10.0.0.80
	gateway 10.0.0.1
	broadcast 10.0.0.255
	netmask 255.255.255.0
	up /sbin/ifenslave bond0 eth1 eth2
	down /sbin/ifenslave -d bond0 eth0 eth1

```
*Note* This is dependant upon the ifenslave package, to install run the following:

* `apt-get install ifenslave`

* Ubuntu 10.04 or newer support an updated interfaces(5) syntax

```
#/etc/network/interfaces 
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
 
auto eth0
    iface eth0 inet manual
    bond-master bond0
 
auto eth1
     iface eth1 inet manual
     bond-master bond0
 
auto bond0
     iface bond0 inet static
     address 10.0.0.80
     gateway 10.0.0.1
     netmask 255.255.255.0
 
 
bond-mode 802.3ad
bond-miimon 100
bond-lacp-rate 4
bond-slaves none
```



* <http://backdrift.org/howtonetworkbonding>


## irqbalance

```
apt-get install irqbalance
```