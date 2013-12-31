#openwrt

Reference

* <http://manoftoday.wordpress.com/2007/10/11/writing-and-compiling-a-simple-program-for-openwrt/>

# ifconfig

<http://wiki.openwrt.org/doc/uci/network>>



## usb series
* How detect
<http://www.devttys0.com/2012/11/reverse-engineering-serial-ports/>

```
screen /dev/tty.usbserial-A9YL1Z3B 115200,-parenb,-cstopb,cs8
```


## write firmware directly

```
cd /tmp
cat /proc/mtd
mtd erase nvram
mtd -r write /tmp/firmware.bin linux

```