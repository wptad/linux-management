# NTP

```

1,查看debian当前时间
  debian:~# date
2,手动更改系统时间
  debian:~# date 120110552007.12
  顺序为      月 日时分 年 . 秒
3,同步Internet时间,首先安装时间同步软件
  apt-get install ntpdate
4,手动同步系统时间
  ntpdate cn.pool.ntp.org
5,如果重新启动后时间不是Internet时间可采取以下方法
法1.修改/etc/default目录下的ntpdate
  在配置文件中发现了它设定时间服务器为pool.ntp.org，
  对此域名执行ping命令，把得到的ip"207.210.74.166"对域名进行替换
法2.做一个同步的脚本ntpupdate在开机时调用,内容如下
  #!/bin/sh
  /usr/sbin/ntpdate time.nist.gov | logger -t NTP
  /sbin/hwclock -w
  
  FROM: http://blog.linuxphp.org/archives/567/
```

* change timezone


```
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

```
