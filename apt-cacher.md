#apt-cacher

## install

* Version 1.7.6

```
apt-get install apt-cacher
```

## configure


* `nano /etc/apt-cacher/apt-cacher.conf `

```
cache_dir = /hdd1/cache/apt-cacher
log_dir = /var/log/apt-cacher
admin_email = wptad@tom.com
daemon_port = 3142
group = www-data
user = www-data
limit = 0
path_map = debian mirrors.163.com/debian/; debian-security security.debian.org; debian-updates mirrors.163.com/debian;
allowed_hosts = *

```

* REFER <https://help.ubuntu.com/community/Apt-Cacher-Server#Import_existing_cached_Packages>


## Import existing cached Packages

```
   sudo /usr/share/apt-cacher/apt-cacher-import.pl -l /var/cache/apt/archives

```


## restart

```
   sudo /etc/init.d/apt-cacher restart

```



## web UI

```
http://127.0.0.1:3142/apt-cacher/
```



## usage

* in clients, configure `nano /etc/apt/sources.list`

```
deb http://10.11.1.112:3142/debian wheezy main

```

OR (recommend)


* `sudo nano /etc/apt/apt.conf.d/01proxy`

```
Acquire::http::Proxy "http://<apt-cacher server>:3142";
```