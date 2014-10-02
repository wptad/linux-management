# wifi_interface

* REFERENCE <https://wiki.debian.org/WiFi/HowToUse>

## wpa_supplicant

```
aptitude install wpasupplicant
```



```
status
list
scan
scan_result
add_network
set_network 0 ssid "ssid"
set_network 0 psk "passowrd"
select_network 0
enable_network 0
save_config
quit

```


* get Address

```
dhclient wlan0
```


* Reference <http://blog.163.com/qk_zhu/blog/static/195076154201132081536347/>