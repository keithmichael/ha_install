# Backup Script


    #!/bin/bash
    #Purpose = Backup of Important Data
    #START
    TIME=`date +%b-%d-%y`            # This Command will add date in Backup File Name.
    FILENAME=backup-$TIME.tar.gz    # Here i define Backup file name format.
    SRCDIR=/home/hass/.homeassistant                    # Location of Important Data Directory (Source of backup).
    DESDIR=/home/pi            # Destination of backup file.
    sudo tar -cpzf $DESDIR/$FILENAME $SRCDIR
    scp /home/pi/$FILENAME username@hostname:/some/folder/$FILENAME
    #END#!/bin/bash