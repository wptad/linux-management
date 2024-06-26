# docker install on debian

## remove old version

```
$ sudo apt-get remove docker \
               docker-engine \
               docker.io
```

## CN Mirror Install 


* add gpg
```

$ curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


# 官方源
# $ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

* add sources
```

$ echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.aliyun.com/docker-ce/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# 官方源
# $ echo \
#   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```

* install 
```

$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io

```

* start
```

$ sudo systemctl enable docker
$ sudo systemctl start docker

```

* user group
```


$ sudo groupadd docker
$ sudo usermod -aG docker $USER

```






refer: [https://yeasy.gitbook.io/docker_practice/install/debian](https://yeasy.gitbook.io/docker_practice/install/debian)
