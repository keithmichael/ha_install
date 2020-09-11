#!/bin/bash

#Homeassistant Update Script

sudo apt update
sudo apt upgrade -y
sudo systemctl stop home-assistant@homeassistant
#Become homeassistant user
sudo su -s /bin/bash homeassistant <<'EOF'
#Activate virtual environment
source /srv/homeassistant/bin/activate
pip3 install --upgrade homeassistant
exit
EOF

sudo systemctl start home-assistant@homeassistant
