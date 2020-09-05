
# Install Node Sonos API

	Sudo apt-get install npm

	cd /opt

	sudo git clone https://github.com/jishi/node-sonos-http-api.git   # Download node-sonos-http-api

	cd node-sonos-http-api/

	sudo npm install --production

	sudo nano /etc/systemd/system/sonosapi.service

	sudo systemctl enable sonosapi.service


[Unit]

Description=Sonos HTTP API Daemon

After=syslog.target network.target

 

[Service]

Type=simple

ExecStart=/usr/bin/node /opt/node-sonos-http-api/server.js

Restart=always

RestartSec=10

 

[Install]

WantedBy=multi-user.target