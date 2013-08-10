#PXE Boot Install 

## DHCP server

* install

``` apt-get install isc-dhcp-server```


* file: /etc/dhcp/dhcpd.conf

- in this example, we serve DHCP requests from 192.168.0.(3 to 253)
- and we have a router at 192.168.0.1


```
default-lease-time 600;
max-lease-time 7200;

allow booting;
allow bootp;


subnet 192.168.5.0 netmask 255.255.255.0 {
  range 192.168.5.55 192.168.5.60;
  option broadcast-address 192.168.5.255;
  option routers 192.168.5.1;             # our router
  option domain-name-servers 192.168.5.1; # our router, again
}

group {
  next-server 192.168.5.1;                # our Server
  host tftpclient1 {
    hardware ethernet  F8:0F:41:2B:45:FC; # replace by the MAC of your Client
    filename "pxelinux.0";
  }
  host fdsffdsa{
    hardware ethernet 11:22:33:44:55:66;
    filename "pxelinux.0";
  }
}



```

* If you wouldn't like to specify a bunch of the MAC addresses in DHCP configuration, use "dynamic-bootp" directive to allow arbitrary PXE clients.


```
default-lease-time 600;
max-lease-time 7200;

allow booting;
allow bootp;

subnet 192.168.0.0 netmask 255.255.255.0 {
    range dynamic-bootp 192.168.0.3 192.168.0.253;
    filename "pxelinux.0";
    option domain-name "yourdomain.com";
    option domain-name-servers 192.168.0.1;
    option broadcast-address 192.168.0.255;
    option routers 192.168.0.1;
}

```
* restart

```# /etc/init.d/isc-dhcp-server restart```



## TFTP service 
* install

```apt-get install tftpd-hpa```

* configure file: /etc/default/tftpd-hpa 
* no need change

```
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="--secure"

```
* restart

```/etc/init.d/tftpd-hpa restart```

* netboot file: <http://ftp.nl.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/>

* put ```netboot.tar.gz``` file here:

```/srv/tftp/```


* ref <http://www.cyberciti.biz/faq/install-configure-tftp-server-ubuntu-debian-howto/>

* Document <https://wiki.debian.org/PXEBootInstall>



##IPMI 

* download: <ftp://ftp.supermicro.com/utility/IPMIView/>
* Reference: <http://christian.hofstaedtler.name/blog/2010/05/lessons-learned-with-supermicros-remote-managementipmi-view.html>

