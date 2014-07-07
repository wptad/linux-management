## swap 

### create file swap
```

dd if=/dev/zero of=/swapfile bs=1024 count=32768k
mkswap /swapfile
swapon /swapfile

```

* REF <https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-12-04>


### remove swap

```
swapoff /dev/hdb2

```


### free cache

```
free && sync && echo 3 > /proc/sys/vm/drop_caches && free

```


* <http://unix.stackexchange.com/questions/87908/how-do-you-empty-the-buffers-and-cache-on-a-linux-system>