## rclone4pi Rclone 4 Raspberry Pi Computer
#### An Easy rclone Install onto a Raspberry Pi Computer with Folder sync demo

## Quick Install
Copy and paste curl command below into logged in RPI putty SSH session

    curl -L https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh | bash

or

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

### For Usage Details See [rclone4pi Wiki](https://github.com/pageauc/rclone4pi/wiki)

## Description
Rclone is a command line program to sync files and directories to and from many remote storage services.
This utility can be used to sync raspberry pi computer folders/files to one or more remote services. For more information about rclone See
 https://rclone.org/ and/or https://github.com/ncw/rclone

Claude Pageau




