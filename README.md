# Set Time Zone
sudo timedatectl set-timezone America/New_York


# Update/Upgrade
sudo apt-get update && sudo apt-get dist-upgrade --yes && sudo apt-get upgrade --yes


# Install Software
sudo apt-get install samba mysql-server mysql-client libmysqlclient-dev autoconf libudev-dev nmap python3 python3-dev python3-venv python3-pip libffi-dev libssl-dev --yes

# Create homeassistant user
sudo useradd -rm homeassistant

# Add user to modem
sudo usermod -G dialout -a homeassistant


#Create directory
cd /srv
sudo mkdir homeassistant
sudo chown homeassistant:homeassistant homeassistant


# Adjust MySQL binding
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf


# Restart MySQL
sudo /etc/init.d/mysql restart



# Log into MySQL
sudo mysql




	CREATE DATABASE hass_db
	  CHARACTER SET utf8
	  COLLATE utf8_general_ci;

	CREATE DATABASE hass_events
	  CHARACTER SET utf8
  COLLATE utf8_general_ci;

 CREATE USER 'hass_usr'@'localhost' IDENTIFIED BY 'ssssssssssssssssssssssssssssssssss';

USE hass_db;
GRANT ALL PRIVILEGES ON *.* TO 'hass_usr'@'localhost';
CREATE USER 'hass_usr'@'%' IDENTIFIED BY 'ssssssssssssssssssssssssssssssssss';
GRANT ALL PRIVILEGES ON *.* TO 'hass_usr'@'%' IDENTIFIED BY 'ssssssssssssssssssssssssssssssssss' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;


sudo su -s /bin/bash homeassistant

cd /srv/homeassistant

python3 -m venv .

source bin/activate

pip3 install homeassistant

exit

sudo nano /etc/systemd/system/home-assistant@homeassistant.service

[Unit]
	Description=Home Assistant
	After=network.target
	
	[Service]
	Type=simple
	User=homeassistant
	ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant"
	
	[Install]
	WantedBy=multi-user.target


	sudo systemctl --system daemon-reload
	sudo systemctl enable home-assistant@homeassistant
sudo systemctl start home-assistant@homeassistant


# Update SAMBA Config
sudo nano /etc/samba/smb.conf



sudo nano /home/homeassistant/.homeassistant/configuration.yaml
db_url: 'mysql://hass_usr:ssssssssssssssssssssssssssssssssss@localhost/hass_db'

sudo chown -R homeassistant /srv/homeassistant