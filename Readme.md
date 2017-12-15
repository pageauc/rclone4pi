## rclone4pi Rclone 4 Raspberry Pi Computer
#### An Easy rclone Install onto a Raspberry Pi Computer with Folder sync demo
[See Wiki for Details](https://github.com/pageauc/rclone4pi/wiki)

## Quick Install
* Step 1 Use mouse left button to highlight curl command in code box below. mouse right click in highlighted area then select Copy.  
* Step 2 On RPI putty or terminal session right click, select paste then Enter to download and run script.


    curl -L https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh | bash

This will install rclone-install.sh, rclone-sync.sh and create a subfolder rpi-sync in users home eg. /home/pi    
    
## Manual Install
Using logged in putty SSH or RPI Terminal session execute commands below

    cd ~
    mkdir -p rpi-sync
    wget -O rclone-install.sh https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh
    wget -O rclone-sync.sh https://raw.github.com/pageauc/rclone4pi/master/rclone-sync.sh
    wget -O rpi-sync/Readme.md https://raw.github.com/pageauc/rclone4pi/master/Readme.md
    chmod +x rclone-install.sh
    chmod +x rclone-sync.sh
    ./rclone-install.sh     # Run Install Script.  You may review script first.

### For Detailed Instructions See [rclone4pi Wiki](https://github.com/pageauc/rclone4pi/wiki)

## Description
Rclone is a command line program to sync files and directories to and from many remote storage services.
This utility can be used to sync raspberry pi computer folders/files to one or more remote services. For more information about rclone See
 https://rclone.org/ and/or https://github.com/ncw/rclone

 
My Raspberry Pi YouTube Stuff https://www.youtube.com/user/pageaucp/search?query=raspberry+pi  
My YouTube Channel https://www.youtube.com/user/pageaucp   
Claude Pageau




