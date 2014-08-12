## fail2ban

```
sudo apt-get install fail2ban

```


## add white list


* nano /etc/fail2ban/jail.conf 

```
[DEFAULT]
# "ignoreip" can be an IP address, a CIDR mask or a DNS host. Fail2ban will not                          
# ban a host which matches an address in this list. Several addresses can be                             
# defined using space separator.
                                                                         
ignoreip = 127.0.0.1 192.168.1.0/24 8.8.8.8

```

* <http://www.fail2ban.org/wiki/index.php/Whitelist>