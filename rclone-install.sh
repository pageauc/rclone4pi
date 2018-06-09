#!/bin/bash
ver="1.6"
echo "$0 ver $ver written by Claude Pageau"

cd ~
if [ ! -f /usr/bin/rclone -o ! -z "$1" ]; then
    echo "-------------------------------------------------------------------------------"
    wget -O rclone.zip https://downloads.rclone.org/rclone-current-linux-arm.zip
    echo "unzip rclone.zip to folder rclone-tmp"
    unzip -o -j -d rclone-tmp rclone.zip
    echo "Install files and man pages"
    cd rclone-tmp
    sudo cp rclone /usr/bin/
    sudo chown root:root /usr/bin/rclone
    sudo chmod 755 /usr/bin/rclone
    sudo mkdir -p /usr/local/share/man/man1
    sudo cp rclone.1 /usr/local/share/man/man1/
    sudo mandb
    cd ..
    echo "Deleting rclone.zip and Folder rclone-tmp"
    rm rclone.zip
    rm -r rclone-tmp
fi

if [ -f /usr/bin/rclone ]; then
    echo "rclone is installed at /usr/bin/rclone"
    rclone -V
    mkdir -p rpi-sync
    cd rpi-sync
    wget -O rclone-sync.sh https://raw.github.com/pageauc/rclone4pi/master/rclone-sync.sh
    wget -O Readme.md https://raw.github.com/pageauc/rclone4pi/master/Readme.md
    wget -O rclone-install.sh https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh
    chmod +x *sh
else
    echo "ERROR - Problem Installing rclone. Please Investigate"
fi

echo "rclone installed at /usr/bin/rclone"
echo "-------------------------------------------------------------------------------"
echo "                 INSTRUCTIONS Google Drive Example

1 You will be required to have a login account on the remote storage service
  Open putty SSH login session to RPI and execute command below

  rclone config

  Follow rclone prompts. For more Details See
  https://github.com/pageauc/rclone4pi/wiki/Home
2 At name> prompt specify a reference name  eg gdmedia
3 At storage> prompt Enter a remote storage number from List
4 Select Auto Config, At Link: prompt, left click
  and highlight rclone url link (do not hit enter)
5 on computer web browser url bar right click paste and go.
6 On computer web browser security page, Confirm access.
7 Copy web browser access security token and paste
  into RPI SSH session rclone prompt. Enter to accept
8 To test remote service access. Execute the following where
  gdmedia is the name you gave your remote service

  rclone ls gdmedia:/

Example sync command make source identical to destination

rclone sync -v /home/pi/rpi-sync gdmedia:/rpi-sync

To upgrade

  cd rpi-sync
  ./rclone-install.sh upgrade

For more Details See https://github.com/pageauc/rclone4pi/wiki/Home
Bye
"


