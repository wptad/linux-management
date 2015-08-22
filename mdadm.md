
## reference

* <http://zackreed.me/articles/38-software-raid-5-in-debian-with-mdadm>

```
## step 1

## parted 



## create md

mdadm -f --create /dev/md1 --level=5 --raid-devices=3 /dev/sd[c-e]1
mdadm --create /dev/md2 --level=5 --raid-devices=3 /dev/sd[f-h]1
mdadm --create /dev/md3 --level=5 --raid-devices=3 /dev/sd[i-k]1
mdadm --create /dev/md4 --level=5 --raid-devices=3 /dev/sd[l-n]1
mdadm --create /dev/md5 --level=5 --raid-devices=3 /dev/sd[o-q]1
mdadm --create /dev/md6 --level=5 --raid-devices=3 /dev/sd[r-t]1
mdadm --create /dev/md7 --level=5 --raid-devices=3 /dev/sd[u-w]1
mdadm --create /dev/md8 --level=5 --raid-devices=3 /dev/sd[x-z]1
mdadm --create /dev/md9 --level=5 --raid-devices=3 /dev/sda[a-c]1
mdadm --create /dev/md10 --level=5 --raid-devices=3 /dev/sda[d-f]1
mdadm --create /dev/md11 --level=5 --raid-devices=3 /dev/sda[g-i]1
mdadm --create /dev/md12 --level=5 --raid-devices=3 /dev/sda[j-l]1





## assemble 
mdadm --assemble /dev/md1 /dev/sd[c-e]1
mdadm --assemble /dev/md2 /dev/sd[f-h]1
mdadm --assemble /dev/md3 /dev/sd[i-k]1
mdadm --assemble /dev/md4 /dev/sd[l-n]1
mdadm --assemble /dev/md5 /dev/sd[o-q]1
mdadm --assemble /dev/md6 /dev/sd[r-t]1
mdadm --assemble /dev/md7 /dev/sd[u-w]1
mdadm --assemble /dev/md8 /dev/sd[x-z]1
mdadm --assemble /dev/md9 /dev/sda[a-c]1
mdadm --assemble /dev/md10 /dev/sda[d-f]1
mdadm --assemble /dev/md11 /dev/sda[g-i]1
mdadm --assemble /dev/md12 /dev/sda[j-l]1


```



```




#!/bin/bash
## step 2
set -e

#start




echo "==Writing the mdadm.conf files =="

cat << EOF > /etc/mdadm/mdadm.conf

# mdadm.conf
#
# Please refer to mdadm.conf(5) for information about this file.
#

# by default (built-in), scan all partitions (/proc/partitions) and all
# containers for MD superblocks. alternatively, specify devices to scan, using
# wildcards if desired.
#DEVICE partitions containers
DEVICE partitions
# auto-create devices with Debian standard permissions
#CREATE owner=root group=disk mode=0660 auto=yes

# automatically tag new arrays as belonging to the local system
HOMEHOST data-server

# instruct the monitoring daemon where to send mail alerts
MAILADDR root


EOF

mdadm --detail --scan | cut -d " " -f 4 --complement >> /etc/mdadm/mdadm.conf

echo "==update initramfs=="
update-initramfs -u -t


echo "==mkfs ext4=="
for (( i=1; i<=12; i++ )) 
do
echo ">> mkfs for md${i}"
mkfs.ext4 -b 4096 -E stride=128,stripe-width=256 /dev/md${i}
done;

echo "==tunefs ext4=="
for (( i=1; i<=12; i++ )) 
do
echo ">> process md${i}"
tune2fs -m 0 /dev/md${i}
done;


echo "==make fstab=="

for (( i=1; i<=12; i++ )) 
do
echo ">> process md${i}"
echo "/dev/md${i}        /hdd${i}            ext4        defaults        0        0" >>/etc/fstab

done;

echo "==clean /hdd*=="
rm -rf /hdd*

echo "==mkdir /hdd*=="
for (( i=1; i<=12; i++ )) 
do
echo ">> process mkdir /hdd${i}"
mkdir /hdd${i}
done;


echo "==mount hdd=="

mount -a

df -h

echo "==mkdir mongo folder=="
for (( i=1; i<=12; i++ )) 
do
echo ">> process mkdir /hdd${i}/shard"
mkdir /hdd${i}/shard
chown -Rh mongodb:mongodb /hdd${i}/shard
done;

mkdir -p /data/config 
chown -Rh mongodb:mongodb /data/config

echo "====DONE!==="



```
