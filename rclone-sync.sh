#!/bin/bash
echo "$0 ver 1.0  written by Claude Pageau"

# prevent multiple instances of rclone from running
if pidof -o %PPID -x "rclone-sync.sh"; then
    echo "WARN  - rclone sync Already Running. Only One Allowed."
    exit 1
fi

# IMPORTANT: Change folders to suit your sync requirements.
localSyncDir="/home/pi/mydir"
remoteSyncDir="mydir"
rcloneName="gdmedia"

/usr/bin/rclone sync -v $remoteSyncDir $rcloneName:$remoteSyncDir