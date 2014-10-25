bind9
=========



### hostname usage


* /etc/resolv.conf

```
search localhost.

```
* and then setting for localhost


```

;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	localhost. root.localhost. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.
@	IN	A	127.0.0.1
@	IN	AAAA	::1
srv1  IN      A       192.168.1.1

```

* ping test


```
> ping srv1
64 bytes from 192.168.1.1: icmp_req=1 ttl=64 time=0.049 ms
```



### captive portal clients


<https://doc.pfsense.org/index.php/Creating_a_DNS_Black_Hole_for_Captive_Portal_Clients>




* /etc/bind/db.example.com


```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns.example.com. root.example.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      localhost.
@       IN      A       10.10.11.200
@       IN      AAAA    ::1
ns      IN      A       10.10.11.200
www     IN      A       10.10.11.200
*       IN      A       10.10.11.200

```





## FAQ

* Host 27.173.150.66.in-addr.arpa not found: 5(REFUSED)

```

acl "trusted" {
	192.168.0.0/16;
	10.10.0.0/16;
	localhost;
	localnets;
};

options {
	allow-recursion { any; };
	allow-query { any; };
	allow-query-cache { any; };	
};


```

* <https://help.ubuntu.com/community/BIND9ServerHowto> 
* Refer <http://www.linuxquestions.org/questions/linux-server-73/bind-refuses-queries-stumped-as-to-why-789332/>
* <https://kb.isc.org/article/AA-00269/0/What-has-changed-in-the-behavior-of-allow-recursion-and-allow-query-cache.html>
* <http://www.math.ucla.edu/~jimc/documents/bugfix/08-dns-query-denied.html>