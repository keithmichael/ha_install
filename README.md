# Set Time Zone
	sudo timedatectl set-timezone America/New_York

# Update/Upgrade
	sudo apt-get update && sudo apt-get dist-upgrade --yes && sudo apt-get upgrade --yes


# Install Software
	sudo apt-get install samba mysql-server mysql-client libmysqlclient-dev autoconf libudev-dev nmap python3.7 python3.7-dev python3.7-venv python3-pip libffi-dev libssl-dev --yes

# Create homeassistant user
	sudo useradd -rm homeassistant

# Add user to modem
	sudo usermod -G dialout -a homeassistant

#Create directory
	cd /srv
	sudo mkdir homeassistant
	sudo chown homeassistant:homeassistant homeassistant

# Activate virtual env
	sudo su -s /bin/bash homeassistant
	cd /srv/homeassistant
	python3.7 -m venv .
	source bin/activate

# Install Home Assistant
	pip3 install homeassistant
	exit

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

# Permission for HA service account
	sudo chown -R homeassistant /srv/homeassistant

# Enable and start HA service
	sudo systemctl --system daemon-reload
	sudo systemctl enable home-assistant@homeassistant
	sudo systemctl start home-assistant@homeassistant


# SAMBA & MySQL

# Update SAMBA Config
	sudo nano /etc/samba/smb.conf

# Add DB Link to configuration.yaml
	nano /home/homeassistant/.homeassistant/configuration.yaml
	db_url: 'mysql://username:password@localhost/hass_db'
	
# Adjust MySQL binding
	sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf


# Restart MySQL
	sudo /etc/init.d/mysql restart

# Log into MySQL
	sudo mysql

# Create HA and Event databases
	CREATE DATABASE hass_db
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

	CREATE DATABASE hass_events
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

# Create DB User
	CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

# Grant Privileges

	USE hass_db;
	GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost';
	CREATE USER 'username'@'%' IDENTIFIED BY 'password';
	GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
	EXIT;