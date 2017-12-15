#!/bin/bash
echo "$0 ver 1.0  written by Claude Pageau"

# prevent multiple instances of rclone from running
if pidof -o %PPID -x "rclone-sync.sh"; then
    echo "WARN  - rclone sync Already Running. Only One Allowed."
    exit 1
fi

# IMPORTANT: Change folders variables to suit your sync requirements.
localSyncDir="/home/pi/rpi-sync"
remoteSyncDir="rpi-sync"
rcloneName="gdmedia"

if [ ! -d "$localSyncDir" ]; then
    echo "ERROR - $localSyncDir Directory Not Found."
    exit 1
fi

echo "Running /usr/bin/rclone sync -v $remoteSyncDir $rcloneName:$remoteSyncDir"

/usr/bin/rclone sync -v $remoteSyncDir $rcloneName:/$remoteSyncDir