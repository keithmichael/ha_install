# Power off/on guest via SSH to ESXi host


    vim-cmd vmsvc/getallvms | grep ServerName

ID will be on left side
 
    vim-cmd vmsvc/power.getstate XXX

    vim-cmd vmsvc/power.on XXX
