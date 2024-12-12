# wg-easy

## Automatically restart in case of DNS failure

nano /lib/systemd/system/wg-quick@.service

```
[Service]
Restart=on-failure
RestartSec=5s
```

# operation

## client

/etc/wireguard/wg0.conf 
```
[Interface]
Address = 
PrivateKey = 
DNS = 
MTU = 1450

[Peer]
PublicKey = 
PresharedKey = 
AllowedIPs = 
Endpoint = 
PersistentKeepalive = 
```

```
# status
systemctl status wg-quick@wg0
# start
systemctl start wg-quick@wg0
# enable
systemctl enable wg-quick@wg0
```

# install



UP: 

```
iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE; iptables -t nat -A POSTROUTING -s 10.252.1.0/24 -o wg0 -j MASQUERADE
```


DOWN: 
```
iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE; iptables -t nat -D POSTROUTING -s 10.252.1.0/24 -o wg0 -j MASQUERADE
```


wireguard.service
```
[Unit]
Description=wireguard
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker rm wireguard
ExecStart=/usr/bin/docker run \
    --name wireguard \
    --log-driver=none \
    --cap-add=NET_ADMIN \
    -e EULA=TRUE \
    -p 51820:51820/udp \
    -v /var/lib/docker/volumes/wireguard/config:/config \
    -e TZ="Asia/Shanghai" \
    linuxserver/wireguard:latest
ExecStop=/usr/bin/docker kill wireguard
Restart=always
RestartSec=5
[Install]
WantedBy=multi-user.target
```

wireguard-ui.service 
```

[Unit]
Description=wireguard-ui
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker rm wireguard-ui
ExecStart=/usr/bin/docker run \
    --name wireguard-ui \
    --log-driver=none \
    --cap-add=NET_ADMIN \
    -p 5000:5000 \
    -e EULA=TRUE \
    -e WGUI_USERNAME=username \
    -e WGUI_PASSWORD=password \
    -e WGUI_MANAGE_START=true \
    -e WGUI_MANAGE_RESTART=true \
    -v /var/lib/docker/volumes/wireguard-ui/db:/app/db \
    -v /var/lib/docker/volumes/wireguard/config:/etc/wireguard \
    -e TZ="Asia/Shanghai" \
    ngoduykhanh/wireguard-ui:latest
ExecStop=/usr/bin/docker kill wireguard-ui
Restart=always
RestartSec=5
[Install]
WantedBy=multi-user.target
```

reference:


```

Frp

tailscale

wireguard 

Parsec





https://linuxiac.com/how-to-set-up-wireguard-vpn-with-docker/






https://www.wireguard.com/quickstart/

https://y2k38.github.io/posts/how-to-setup-wireguard-vpn-server/
https://www.covertness.me/2018/03/25/%E8%BD%BB%E6%9D%BE%E5%87%A0%E6%AD%A5%E6%90%AD%E5%BB%BA%20WireGuard%20%EF%BC%88%E5%BF%AB%E9%80%9F%E5%AE%89%E5%85%A8%E7%9A%84%E4%B8%8B%E4%B8%80%E4%BB%A3%20VPN%EF%BC%89/

https://www.procustodibus.com/blog/2020/11/wireguard-point-to-site-config/
https://github.com/RealTong/Profile/blob/main/Conf/WireGuard/Home.conf
https://github.com/activeeos/wireguard-docker/blob/master/scripts/run.sh



https://hub.docker.com/r/linuxserver/wireguard



https://www.procustodibus.com/blog/2020/11/wireguard-point-to-site-config/#configure-routing-on-host-b

https://icloudnative.io/posts/wireguard-docs-practice/



1. WireGuard官方文档： https://www.wireguard.com/quickstart/
2. WireGuard on Docker教程： https://hub.docker.com/r/linuxserver/wireguard
3. 更复杂的使用Docker部署WireGuard的教程： https://www.ckn.io/blog/2017/11/14/wireguard-vpn-typical-setup/
4. Docker官方文档（这里有关于网络设置和权限等问题的说明）： https://docs.docker.com/
5. Docker和WireGuard的示例配置和教程（GitHub）： https://github.com/activeeos/wireguard-docker
以上链接可以为你提供WireGuard在Docker中部署的基础理解和示例配置，但也请根据你自己的系统环境和特定需求进行调整和优化。

```
