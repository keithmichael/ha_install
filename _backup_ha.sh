#!/bin/bash
# $(date +%Y_%m_%d_)
#START
TIME=`date +%Y-%m-%d` # This Command will add date in Backup File Name.
FILENAME=hass_config_backup_$TIME.tar.gz # Here i define Backup file name format.
SRCDIR=/home/homeassistant/.homeassistant/ # Location of Important Data Directory (Source of backup).
DESDIR=/home/homeassistant/.homeassistant/backups/ # Destination of backup file.
tar --exclude='/home/homeassistant/.homeassistant/backups' --exclude='*.wav' --exclude='/home/homeassistant/.homeassistant/node-sonos-api' -cpzf $DESDIR/$FILENAME $SRCDIR >/dev/null 2>&1


#END#!/bin/bash
