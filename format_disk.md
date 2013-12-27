#format disk


## ext4


```
mkfs.ext4 -O ^has_journal -t ext4 -b 4096 /dev/sdb1 
```

## fdisk

`fdisk /dev/sdb`

```
Command (m for help): mkfs.ext2 -b 4096 -t ext2 /dev/sdb1
Command action
   a   toggle a bootable flag
   b   edit bsd disklabel
   c   toggle the dos compatibility flag
   d   delete a partition
   l   list known partition types
   m   print this menu
   n   add a new partition
   o   create a new empty DOS partition table
   p   print the partition table
   q   quit without saving changes
   s   create a new empty Sun disklabel
   t   change a partition's system id
   u   change display/entry units
   v   verify the partition table
   w   write table to disk and exit
   x   extra functionality (experts only)

Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-1953525167, default 2048): 
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-1953525167, default 1953525167): 
Using default value 1953525167

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
```


`mkfs.ext2 -b 4096 -t ext2 /dev/sdb1`



## check uuid

```
blkid
```

refer: 
* <http://linuxg.net/3-ways-to-get-the-hard-drives-uuid/>
* <https://help.ubuntu.com/community/UsingUUID>


## SSD

* enable TRIM

```
/dev/sda1 / ext4 discard,defaults
```
<http://www.linuxidc.com/Linux/2012-09/70519.htm>
* <http://www.mabishu.com/blog/2012/12/14/get-better-performance-and-life-from-your-ssd-in-linux-based-systems/>

## mount  --bind

* <http://backdrift.org/how-to-use-bind-mounts-in-linux>
* <http://www.cnitblog.com/gouzhuang/archive/2010/04/21/mount_bind.html>