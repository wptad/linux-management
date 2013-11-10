#lvs
## Document

<http://www.austintek.com/LVS/>

## 查看状态

```
查看LVS的连接情况:ipvsadm -L -n
查看LVS的吞吐量情况: ipvsadm -L -n --rate
查看LVS的统计信息:ipvsadm -L -n --stats
实时查看LVS连接状态变化: watch ipvsadm -ln

```

<http://blog.chinaunix.net/uid-16844903-id-294706.html>

## install

`aptitude install ipvsadm ntp`

## configure

* file: ``/etc/ipvsadm.rules``

* reload `ipvsadm --restore < /etc/ipvsadm.rules`

* check rules: `ipvsadm -ln`

* Refer: <http://kb.linuxvirtualserver.org/wiki/Ipvsadm>