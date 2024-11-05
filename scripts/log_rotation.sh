#!/usr/bin/env bash

# assuming all log files under /var/log 

#Vars
log_dir="/var/log"
max_log_size="1M" # size in M
max_log_time=30  # days to remove the log.
archive_dir="~/archive"

# for testing you can create a file with fixed size using:
# tail --bytes 5M /dev/zero > file.txt 

#Functions 
# find files large files inside log directory.
log_rotate() {
  find /home/user/Desktop -type f -size +$max_log_size -exec sh -c 'tar -czvf "{}".$(date %Y-%m-%d) "{}" ;mv "{}".$(date %Y-%m-%d) /home/user/Documents' \;
}

# remove files older than 30 days.
log_remove() {
  cd /home/user/Documents find . -type f -mtime -30 -exec rm {} \;
}

# run functions 
log_rotate
log_remove

