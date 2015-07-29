
#format disk


## RAID

* <http://zackreed.me/articles/38-software-raid-5-in-debian-with-mdadm>

## benchmark

```
dd bs=100M count=10 if=/dev/zero of=test111111 oflag=dsync  
```
* REF<https://romanrm.net/dd-benchmark>

## format gtp harddisk

```
sudo parted /dev/sda --script mklabel gpt  mkpart primary ext4 0% 100% 
```
* parted, gdisk

## script fdisk

* sfdisk


## tools

```
#check hdd features
dumpe2fs /dev/md0 
debugfs -R features /dev/sda1

# change some features
tune2fs -O ^has_journal /dev/sda1

# check hdd 
e2fsck -f /dev/sda1

```

## Smartmontools

```
apt-get install smartmontools

```

* superblock恢复 <http://wenku.baidu.com/link?url=vDdhcgZZcLzYEiSYO0eZ3Ql_X8G55PI38t0KZ3zixQIJH4JdoU9CEhaLuzeND64FWQgRom4M2VVwHtx6Lm20n_YqEDs98aQa_XmGUc6o_DK>

## fdisk

`fdisk /dev/sdb`

```
Command (m for help):
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


## ext4


```
mkfs.ext4 -O ^has_journal -t ext4 -b 4096 /dev/sdb1 

mkfs.ext2 -b 4096 -t ext2 /dev/sdb1

```

## fstab

```
/dev/sdb1       /hdd1   ext4    defaults,rw,auto,nouser,nodev,nosuid,noexec,noatime,nodiratime  0       0

```


## check uuid

```
blkid
```

refer: 
* <http://linuxg.net/3-ways-to-get-the-hard-drives-uuid/>
* <https://help.ubuntu.com/community/UsingUUID>


## move log in hdd

```
/hdd1/log       /var/log  none  bind                                                            0       0

```

## SSD

* enable TRIM

```
/dev/sda1 / ext4 discard,defaults
```
<http://www.linuxidc.com/Linux/2012-09/70519.htm>
* <http://www.mabishu.com/blog/2012/12/14/get-better-performance-and-life-from-your-ssd-in-linux-based-systems/>

## mount  --bind

```
tmpfs   /memflode  tmpfs   defaults,size=1g       0       0

```

* <http://backdrift.org/how-to-use-bind-mounts-in-linux>
* <http://www.cnitblog.com/gouzhuang/archive/2010/04/21/mount_bind.html>





## check hdd

```
apt-get install smartmontools
smartctl /dev/sda -a
```
