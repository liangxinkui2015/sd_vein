### edit /lib/systemd/system    
```
[Unit]
Description=Dockerized Vein Prd Service
After=docker.service
BindsTo=docker.service
Conflicts=shutdown.target reboot.target halt.target
 
[Service]
TimeoutStartSec=0
TimeoutStopSec=30
Restart=always
RestartSec=10
 
WorkingDirectory=/docker/compose/prd
 
ExecStart=/usr/bin/docker-compose /docker/compose/prd/docker-compose.yml up
 
ExecStop=/usr/bin/docker-compose /docker/compose/prd/docker-compose.yml down
 
NotifyAccess=all
 
[Install]
WantedBy=multi-user.target
```

### 启动
```
sudo systemctl enable veinprd
```

### disable
```
sudo systemctl disable veinprd
```