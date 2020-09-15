# Notes
  This build requires Ubuntu. Steps for SAMBA/MySQL soon.

# Set Time Zone
	sudo timedatectl set-timezone America/New_York

# Update/Upgrade
	sudo apt-get update && sudo apt-get dist-upgrade --yes && sudo apt-get upgrade --yes


# Install Software
	sudo apt-get install autoconf libudev-dev nmap python3 python3-dev python3-venv python3-pip libffi-dev libssl-dev --yes

# Create homeassistant user
	sudo useradd -rm homeassistant

# Add user to modem
	sudo usermod -G dialout -a homeassistant

# Create directory
	cd /srv
	sudo mkdir homeassistant
	sudo chown homeassistant:homeassistant homeassistant

# Activate virtual env
	sudo su -s /bin/bash homeassistant
	cd /srv/homeassistant
	python3 -m venv .
	source bin/activate

# Install Home Assistant
	pip3 install homeassistant
	exit

# Permission for HA service account
	sudo chown -R homeassistant /srv/homeassistant

# Create Service for HA
	sudo nano /etc/systemd/system/home-assistant@homeassistant.service

# Contents of service file
	[Unit]
	Description=Home Assistant
	After=network.target
	[Service]
	Type=simple
	User=homeassistant
	ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant"
	[Install]
	WantedBy=multi-user.target

# Enable and start HA service
	sudo systemctl --system daemon-reload
	sudo systemctl enable home-assistant@homeassistant
	sudo systemctl start home-assistant@homeassistant

