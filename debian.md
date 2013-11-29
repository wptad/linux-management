#deiban 



* <http://backports.debian.org/debian-backports/dists/squeeze-backports/>

## debian Install with SataRaid

* <https://wiki.debian.org/DebianInstaller/SataRaid>

### NetXtreme II 10 Gigabit Driver Downloads

* <http://www.broadcom.com/support/ethernet_nic/netxtremeii10.php>
* <http://www.broadcom.com/support/license.php?file=NXII_10/linux-7.8.56.zip>

##update core

* <http://www.cnblogs.com/coding-way/archive/2012/01/08/2316221.html>

* Upgrade Debian 6.0 Squeeze to 7.0 Wheezy <http://www.garron.me/en/linux/upgrade-debian-squeeze-wheezy-6.0-7.0.html>


## START WITH TERMINAL


```
// disable GUI
update-rc.d -f gdm3 remove 

// enable GUI
update-rc.d gdm3 default 

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