apt-get  install --only-upgrade bash


* error

```

W: GPG error: http://mirrors.163.com wheezy Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 8B48AD6246925553 NO_PUBKEY 6FB2A1C265FFB764

```



* 

```
apt-key list
apt-get install debian-archive-keyring
```

* <http://vpsmate.net/gpg-error-no_pubkey-debian-6-0-squeeze.html>