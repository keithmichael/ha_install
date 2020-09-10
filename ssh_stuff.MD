# SSH Stuff

SSH Command which HA can use while in docker. It will SSH to another computer and run a shell script

    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /config/.ssh/id_rsa km@192.168.1.200 sh /home/km/testing.sh
