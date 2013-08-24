#lvs

##install

`aptitude install ipvsadm ntp`

##configure

* file: ``/etc/ipvsadm.rules``

* reload `ipvsadm --restore < /etc/ipvsadm.rules`

* check rules: `ipvsadm -Ln`