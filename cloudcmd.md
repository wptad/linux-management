
cloudcmd.service
```
[Unit]
Description=cloudcmd
After=docker.service
Requires=docker.service
[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker rm cloudcmd
ExecStart=/usr/bin/docker run \
    --name cloudcmd \
    -p 8000:8000 \
    --user=1000:1000 \
    -e CLOUDCMD_ROOT=/data/upload \
	-e CLOUDCMD_USERNAME=username \
	-e CLOUDCMD_PASSWORD=password \
	-e CLOUDCMD_AUTH=true \
    -v /data/upload:/data/upload \
    -v /etc/localtime:/etc/localtime:ro \
    --log-driver=none \
    coderaiser/cloudcmd
ExecStop=/usr/bin/docker kill cloudcmd
Restart=always
RestartSec=5
[Install]
WantedBy=multi-user.target
```
