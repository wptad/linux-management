# Cisco Command

## normal

```

* en 

// 启动路由功能 
* ip routing
// 关闭路由功能 
* no ip routing
// 查看路由状态
* show run
// 全局
* configure terminal
// 查看vlan 状态
* do show vlan
// 查看端口状态
* sh ip interface br

// 进入vlan 
* int vlan 2
```

### 配置vlan

```
>> interface vlan [vlan-id]

Enter interface configuration mode, and enter the VLAN to which the IP information is assigned. The range is 1 to 4094 when the enhanced software image is installed and 1 to 1001 when the standard software image is installed. Do not enter leading zeros.

>> ip address [ip-address] [subnet-mask]

>> ip default-gateway [ip-address]

Enter the IP address of the next-hop router interface that is directly connected to the switch where a default gateway is being configured. The default gateway receives IP packets with unresolved destination IP addresses from the switch.
Once the default gateway is configured, the switch has connectivity to the remote networks with which a host needs to communicate.

```

### trunk 二个交换机
```
interface g1/0/1
switchport mode trunk 
switchport mode access

vtp mode

```