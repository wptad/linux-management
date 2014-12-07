#ssh 

* <http://docs.oseems.com/general/application/ssh/disable-timeout>


## 在一个列表里选定主机名后直接 SSH 登陆

* <http://www.vpsee.com/2014/08/a-bash-script-to-ssh-from-a-list-of-hostnames/>


## disable root login from specific ip range

```
ClientAliveInterval 30
ClientAliveCountMax 1

Match Address *,!10.11.0.0/16
	PermitRootLogin no

```
