# sshfs


## install in debian


```
apt-get install debian -y
```

## usage

```
sshfs root@IP:/hdd/ /hdd/ 
```

```
sshfs root@IP:/hdd/ /hdd/  -o Ciphers=arcfour -o compression=no

```

### without encryption

For sftp with no encryption, use sshfs + socat

On the server side run

```
socat TCP4-LISTEN:7777 EXEC:/usr/lib/sftp-server
```

```
socat TCP4-LISTEN:7777,fork EXEC:/usr/lib/sftp-server

```

And on the client side

```
sshfs -o directport=7777 remote:/dir /local/dir
OR

#read only 
sshfs -o ro -o directport=7777 remote:/dir /local/dir

```


* REFER <http://computers.findincity.net/view/63539929521204805841192/sshfs-mount-without-compression-or-encryption>
