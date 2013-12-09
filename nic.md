#NIC

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


# depmod

* <http://blog.chinaunix.net/uid-16330130-id-2747402.html>

#Intel

* Driver <https://downloadcenter.intel.com/Detail_Desc.aspx?agr=Y&DwnldID=15817&lang=zho&OSVersion=Linux*&DownloadType=>
* README: <http://downloadmirror.intel.com/15817/eng/README.txt>



#eth sequence

```
/etc/udev/rules.d/z25_persistent-net.rules

```