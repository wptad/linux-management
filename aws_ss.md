#AWS shadowsocks

```
sudo yum install  build-essential autoconf libtool openssl-devel.x86_64
wget https://github.com/shadowsocks/shadowsocks-libev/archive/master.zip
unzip master.zip
cd shadowsocks-libev
./configure
make
make install

ss-server -c ss.conf

```

* ss.conf

```

{
    "server":"0.0.0.0",
    "server_port":10010,
    "password":"password",
    "timeout":300,
    "method":"aes-256-cfb", 
    "fast_open": true 
}
```



#iftop by yum install

```
sudo yum -y install ncurses-devel libpcap-devel
wget http://pkgs.repoforge.org/iftop/iftop-0.17-1.el6.rf.x86_64.rpm
rpm -ivh iftop-0.17-1.el6.rf.x86_64.rpm
```