bind9
=========


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