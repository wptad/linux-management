#redis


## install latest version in debian

```
Editor file: 
nano /etc/apt/sources.list.d/dotdeb.org.list

deb http://packages.dotdeb.org squeeze all
deb-src http://packages.dotdeb.org squeeze all

```
authenticate these repositories using their public key.

```
wget -q -O - http://www.dotdeb.org/dotdeb.gpg | apt-key add -

```
update your APT cache and install Redis.

```
apt-get update
apt-get install redis-server


```


* Refer: <http://vvv.tobiassjosten.net/linux/installing-redis-on-ubuntu-with-apt/>



### sysctl.conf

```
vm.overcommit_memory = 1

```
