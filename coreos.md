



## etcd config


```
$ cat /run/systemd/system/etcd.service.d/20-cloudinit.conf

```

cat /run/systemd/system/etcd.service.d/20-cloudinit.conf
fleetctl list-machines


##Running etcd in Docker Containers


* <https://coreos.com/blog/Running-etcd-in-Containers/>


```




对Linux和命令行不熟悉的话会有一些难度，其实内容精简下来只有几个步骤：
0) 系统要求：已经安装 git 和 Vagrant
1) 执行 git clone https://github.com/coreos/coreos-vagrant.git
2) 访问 https://discovery.etcd.io/new 获得一个集群标识
3) 修改 user-data 和 config.rb 文件
4) 执行 vagrant up
因为国内网络的特殊原因，如果不具备翻墙条件，在执行 vagrant up 之前要手工安装 CoreOS 的镜像，方法见下面评论。
```


```
vagrant up

vagrant ssh core-01

sudo systemctl start hello

sudo systemctl enable hello.service

journalctl --unit hello.service

journalctl --unit hello.service --follow

sudo systemctl list-units
sudo systemctl list-unit-files


sudo systemctl start <Unit名称> 
sudo systemctl stop <Unit名称> 
sudo systemctl kill <Unit名称> 
sudo systemctl restart <Unit名称>
kill -s SIGKILL 

systemctl list-units hell*

sudo systemctl daemon-reload

移除这些已经被标记为丢失的Unit文件。
sudo systemctl reset-failed


vagrant ssh core-01 -- -A

这里的“-- -A”前两的个横杆表示ssh参数的起始。之后的 -A 是标准的 ssh 命令参数，表示将主机的SSH秘钥传递到虚拟机里面，


fleetctl list-units
fleetctl list-machines 


 fleetctl start ${HOME}/hello.service 





$ fleetctl submit ${HOME}/hello.service 
$ fleetctl list-unit-files 
UNIT  HASH  DSTATE  STATE  TARGET 
hello.service  4bff33d  inactive  inactive  - 
$ fleetctl list-units 
UNIT  MACHINE  ACTIVE  SUB






 fleetctl submit ${HOME}/hello.service 
 fleetctl load hello.service 
fleetctl start hello.service 

fleetctl list-units 
fleetctl list-unit-files


fleetctl stop hello.service 
fleetctl unload hello.service 
fleetctl destroy hello.service 

 fleetctl status hello.service 

eval `ssh-agent -s`

 
 

vagrant ssh-config

```




```


cat /run/systemd/system/etcd.service.d/20-cloudinit.conf

etcdctl -o extended get /coreos.com/updateengine/rebootlock/semaphore
etcdctl get /coreos.com/updateengine/rebootlock/semaphore
etcdctl ls /_etcd/machines --recursive
etcdctl ls / --recursive

etcdctl mkdir /demo
 etcdctl mk /demo/hello "Hello Etcd"
 etcdctl update /demo/hello "Hello CoreOS"
 etcdctl rm /demo/hello
 etcdctl get /demo/hello
etcdctl rm /path --recursive
etcdctl mkdir /path/to/demo --ttl 120  

etcdctl mk /path/to/demo/title “Message Title” --ttl 120 

etcdctl updatedir /path/to/demo --ttl 500 
etcdctl update /path/to/demo/titl “Message Title” e--ttl 400

这个命令可以接收一个参数 --recursive 用于递归监听指定路径下所有子路径的变化。

core@core-01 ~ $ etcdctl watch --recursive /path


 curl -L http://127.0.0.1:4001/v2/keys/ 
 
  curl -L http://127.0.0.1:4001/v2/keys/coreos.com/updateengine/rebootlock/semaphore 
  
  
  curl -L http://127.0.0.1:4001/v2/keys/path/demo2-XPUT -d dir=true 
{ 
  "action": "set", 
  "node": { 
  "key": "/path/demo2", 
  "dir": true, 
  "modifiedIndex": 248955, 
  "createdIndex": 248955 
  } 
}




curl -L http://localhost:4001/v2/keys/path/demo1-XPUT -d value="Hey" 
{ 
  "action": "set", 
  "node": { 
  "key": "/path/demo1", 
  "value": "Hey", 
  "modifiedIndex": 248530, 
  "createdIndex": 248530 
  } 
}




POST操作的作用是创建一组以有序数值为键的序列，说起来比较抽象，举个例子。

curl -L http://127.0.0.1:4001/v2/keys/path/demo-XPOST -d value="Val1" 
curl -L http://127.0.0.1:4001/v2/keys/path/demo-XPOST -d value="Val2" 
curl -L http://127.0.0.1:4001/v2/keys/path/demo-XPOST -d value="Val3" 
curl -L http://127.0.0.1:4001/v2/keys/path/demo 
{ 
  "action": "get", 
  "node": { 
  "key": "/path/demo", 
  "dir": true, 
  "nodes": [{ 
  "key": "/path/demo/206981", 
  "value": "Val3", 
  "modifiedIndex": 206981, 
  "createdIndex": 206981 
  }, { 
  "key": "/path/demo/206975", 
  "value": "Val1", 
  "modifiedIndex": 206975, 
  "createdIndex": 206975 
  }, { 
  "key": "/path/demo/206978", 
  "value": "Val2", 
  "modifiedIndex": 206978, 
  "createdIndex": 206978 
  }], 
  "modifiedIndex": 206975, 
  "createdIndex": 206975 
  } 
}






curl -L http://127.0.0.1:4001/v2/keys/path/demo?dir=true\&recursive=true-XDELETE 
{ 
  "action": "delete", 
  "node": { 
  "key": "/path/demo", 
  "dir": true, 
  "modifiedIndex": 207070, 
  "createdIndex": 206975 
  }, 
  "prevNode": { 
  "key": "/path/demo", 
  "dir": true, 
  "modifiedIndex": 206975, 
  "createdIndex": 206975 
  } 
}



 curl -L http://127.0.0.1:4001/v2/stats/leader 
 
 curl -L http://127.0.0.1:4001/v2/stats/self 
 
 
 
 有一个存放了集群节点信息的隐藏键，可以通过curl -L http://127.0.0.1:4001/v2/keys/_etcd命令查看到，这个键在 V2.0 中合并到 /v2/member 中成为非隐藏的普通键了。 
 
 
```