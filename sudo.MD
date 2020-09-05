# SUDO Change


    sudo visudo
    add to bottom of line
    #includedir /etc/sudoers.d
    username ALL=(ALL) NOPASSWD: ALL
