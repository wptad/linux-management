#openwrt

Reference

* <http://manoftoday.wordpress.com/2007/10/11/writing-and-compiling-a-simple-program-for-openwrt/>

# compile 

* ubuntu requirement
```
sudo apt-get install subversion git flex g++ gawk zlib1g-dev libncurses5-dev

```

# mtd bakup

* <http://www.haiyun.me/archives/openwrt-mtd-sysupgrade.html>
* <http://see.sl088.com/wiki/Openwrt_%E5%AE%8C%E6%95%B4%E5%A4%87%E4%BB%BD%E6%95%B0%E6%8D%AE%E7%9B%98>

# ifconfig

<http://wiki.openwrt.org/doc/uci/network>>



## usb series
* How detect
<http://www.devttys0.com/2012/11/reverse-engineering-serial-ports/>

```
screen /dev/ttyUSB0 115200,-parenb,-cstopb,cs8
```


## write firmware directly

```
cd /tmp
cat /proc/mtd
mtd erase nvram
mtd -r write /tmp/firmware.bin linux

```


## CH340G TTL driver

<http://www.wch.cn/download/list.asp?id=178>