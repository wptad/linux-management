#lvs
## Document

<http://www.austintek.com/LVS/>

## install

`aptitude install ipvsadm ntp`

## configure

* file: ``/etc/ipvsadm.rules``

* reload `ipvsadm --restore < /etc/ipvsadm.rules`

* check rules: `ipvsadm -ln`

* Refer: <http://kb.linuxvirtualserver.org/wiki/Ipvsadm>