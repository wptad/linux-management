## locale

```
aptitude install ntpdate
执行
tzselect
按照提示进行选择时区
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
执行
sudo ntpdate cn.pool.ntp.org
cn.pool.ntp.org是位于中国的公共NTP服务器，用来同步你的时间
```

### Refer
* <http://www.blogjava.net/mstar/archive/2011/09/07/211880.html>
