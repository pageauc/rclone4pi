## rclone4pi
### Simple rclone Install and sync demo 

* [Quick Install](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#quick-install)
* [Introduction](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#introduction)  
* [Installation](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-install-rclone)  
* [Configure a Remote Storage Service](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-setup-a-remote-service-using-rclone)   
* [Testing](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-test-rclone)  
* [Automate](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-automate-rclone)  

***NOTICE:***  rclone is now the current rclone4pi default installed by rclone4pi-install.sh. If previous /usr/local/bin/gdrive file exist is will remain. If rclone not already installed see [install](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-install-rclone) and [configure](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-setup-a-remote-service-using-rclone) rclone per instructions below.

### Quick Install (if not already installed by rclone4pi-install.sh)
Copy and paste curl command below into logged in RPI putty SSH session

    curl -L https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh | bash

### Introduction
Rclone is a command line program to sync files and directories to and from many remote storage services. This utility can be used to update rclone4pi media folders/files to one or more remote services. For more information about rclone See  
 https://rclone.org/ and/or https://github.com/ncw/rclone
    
### How to Install rclone
The rclone-install.sh script. To run the install script from rclone4pi folder, execute the following commands

    cd ~/rclone4pi
    ./rclone-install.sh
    
To install a remote storage service, follow [wiki](https://github.com/pageauc/rclone4pi/wiki/How-to-Setup-rclone#how-to-configure-a-remote-service-using-rclone) or basic script instructions after install is complete. ***Note*** Instructions were tested with google drive. You will need to follow slightly different prompt instructions for other remote storage services.

***Manual Install***   
You can also download it separately using wget and manually install.  This allows you to inspect script before executing.

    wget -O rclone-install.sh -q --show-progress https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh
    chmod +x rclone-install.sh
    ./rclone-install.sh

***Upgrade***
To upgrade/repair existing installation specify any parameter eg.

    ./rclone-install.sh upgrade 

### How to Configure a remote service using rclone
To configure one rclone remote storage service on a raspbery pi computer follow the steps below.  If a service is already installed you will see an interactive configuration menu that allows you to change/remove existing service(s) or add a new one.

***Example Steps for Google Drive***    
1 Open putty SSH login session to Raspberry Pi and execute command below, then follow ***rclone config*** interactive prompts. You will be required to have a login account on the remote storage service.

      rclone config

2 Select new, At ***name>*** enter service name eg gdmedia, At ***Storage>*** enter number for google drive   
3 Follow prompts and accept defaults where appropriate.  
4 At ***Use auto config?*** select n  
5 rclone will display a long url at ***link:*** prompt.    
6 On RPI SSH session, click and hold left mouse button and highlight https url after ***link:*** (do not press enter key)    
7 On computer web browser that is logged into service, right click, paste and go on browser url bar.  
8 On computer web browser service security web page, Select user if appropriate then confirm access. An Long verification code will be displayed. Use Mouse to highlight and copy verification code    
9 On RPI SSH session right click at prompt ***Enter verification code>*** and paste verification code, Enter to accept
10 Select n for Configure this as a team drive?
11 Review and accept when prompted.
 
For more details see [https://rclone.org/drive/](https://rclone.org/drive/)

### How to Test rclone
To test connection to remote service. Execute the following command where ***gdmedia:*** is the name you gave your remote storage service. After a short delay this will list the files and folders in the root of your remote drive. ***Note*** Remote Paths are specified as ***remote:path*** where ***remote:*** is name you gave remote storage service. 

list All files on remote storage service

    rclone ls gdmedia:

list directories

    rclone lsd gdmedia:

To get command help, type ***rclone*** with no parameters or ***rclone --help***

***Example sync*** 
From RPI Folder media/motion
To remote service name gdmedia: and media/motion folder

    rclone sync -v /home/pi/rclone4pi/media/motion gdmedia:media/motion

***Important*** If the media/motion folder has a large number of files and you just want recent status then edit rclone4pi config.py motionRecentMax= variable to required recent entries. Then rclone the media/recent/motion folder or whatever foldermotionRecentDir = variable is set to. 

### How to Automate rclone

To avoid multiple instances of rclone running, a small batch file called rclone-sync.sh will only allow one instance to run. Run commands below to edit the rclone-sync.sh script variables.

    cd ~/rclone4pi
    nano rclone-sync.sh

Edit variables for source, destination, remote storage name as required
ctrl-x y to save and exit nano editor

Test script per commands below. After a short delay you should see sync progress.

    ./rclone-sync.sh

The best way to automate rclone is to add a crontab entry to run rclone-sync.sh at regular intervals. See example below

    sudo crontab -e
    
Add entry to the crontab similar to below. If using nano ctrl-x y to save changes and exit.

    */5 * * * * /home/pi/rclone4pi/rclone-sync.sh > /dev/null

This will run rclone-sync.sh every five minutes and make the remote folder identical to the source folder.  You can change the frequency to what every you like.  Just make sure you leave enough time to upload files. 


