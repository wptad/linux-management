# lxc


## install

```
apt-get install autoconf automake pkg-config make gcc debootstrap libvirt-bin bridge-utils

git clone https://github.com/lxc/lxc.git

cd lxc

./autogen.sh 
./configure     OR  ./configure --prefix=/usr/local
make 
make install
```

* if cannot find `lxc.so`, try


```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

```

* cgroup  

/etc/fstab :

```
cgroup  /cgroup  cgroup  defaults  0   0
```

* bridge configuration

BRIDGE MODE

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
    address 192.168.100.5
    netmask 255.255.255.0
    gateway 192.168.100.1


```

* check


/> lxc-checkconfig 

```
Kernel configuration not found at /proc/config.gz; searching...
Kernel configuration found at /boot/config-3.12-0.bpo.1-amd64
--- Namespaces ---
Namespaces: enabled
Utsname namespace: enabled
Ipc namespace: enabled
Pid namespace: enabled
User namespace: enabled
Network namespace: enabled
Multiple /dev/pts instances: enabled

--- Control groups ---
Cgroup: enabled
Cgroup clone_children flag: enabled
Cgroup device: enabled
Cgroup sched: enabled
Cgroup cpu account: enabled
Cgroup memory controller: enabled
Cgroup cpuset: enabled

--- Misc ---
Veth pair device: enabled
Macvlan: enabled
Vlan: enabled
File capabilities: enabled

Note : Before booting a new kernel, you can check its configuration
usage : CONFIG=/path/to/config /usr/local/bin/lxc-checkconfig

```


*  Configuration

Global: 

```
/usr/local/share/lxc/config/debian.common.conf
```

template default: 

```
/usr/local/etc/lxc/default.conf
```

each container conf and rootfs folder: 

```
/usr/local/var/lib/lxc/test/config 
```



## multi-nic config

```
lxc.network.mtu = 1500
lxc.network.type = veth
lxc.network.name = eth0
lxc.network.link = br0
lxc.network.ipv4 = 192.168.0.2/16
lxc.network.flags = up

lxc.network.type = veth
lxc.network.link = br1
lxc.network.ipv4 = 10.10.0.2/16
lxc.network.name = eth1
lxc.network.flags = up


```

## Reference

* <http://foaa.de/old-blog/2010/05/lxc-on-debian-squeeze/trackback/index.html>
