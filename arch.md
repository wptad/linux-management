#arch

## install ifconfig

```
pacman -S net-tools dnsutils inetutils iproute2
```

##  enable dhcp

* 动态 IP



```
使用 dhcpcd
如果你只使用一个单一的固定有线网络连接,你并不需要网络管理服务的话,你可以简单的使用 dhcpcd 服务. 在这里, interface_name 是你的网卡名称:
>> systemctl enable dhcpcd.service
如果不行，试试：
>> systemctl enable dhcpcd@interface_name.service

```

* 使用 netctl

```
复制一个简单的配置样本 /etc/netctl/examples 到 /etc/netctl/:
>> cd /etc/netctl
>> cp examples/ethernet-dhcp my-network
根据你的需要修改配置文件 (修改 Interface):
>> nano my-network
启用这个 my-network 配置:
>> netctl enable my-network

```

* Refer : <https://wiki.archlinux.org/index.php/Beginners%27_Guide>