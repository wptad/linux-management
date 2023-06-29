
# network test

## 获取当前公网ip地址：

```
curl ifconfig.co
wget -qO - ifconfig.co
```

## 获取当前网络所属country：

```
curl ifconfig.co/country
wget -qO - ifconfig.co/country
```

## 获取当前网络所属country-iso：

```
curl ifconfig.co/country-iso
wget -qO - ifconfig.co/country-iso
```

## ping

```
利用“ping”命令可以检查网络是否连通，可以很好地帮助我们分析和判定网络故障

```

```
ping m.adpro.cn

查看本机与广告家服务器的网络连通性
```


## 路由

* 如果不通的话，请查看网络路由信息

### windows

```
tracert IP或者域名

例如: 
tracert m.adpro.cn

```


### linux: 

```
traceroute IP或者域名

例如: 
traceroute m.adpro.cn

```


