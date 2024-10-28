#!/usr/bin/env bash

#Vars
system_threshold=90  # add threshold here for the whole system.
home_threshold=85  # add threshold here for /home 

#Commands
disk_usage_home=$(df -aH /home | awk '{print $5}' | tail -n 1 | tr -d "%")
disk_usage_system=$(df -aH /     | awk '{print $5}' | tail -n 1 | tr -d "%")

#Checks
if [[ $disk_usage_system -gt $system_threshold ]];then 
  notify-send -t 3000 "Warning!! Disk Usage for the system is $disk_usage_system% "
  echo "Disk Usage for the system is $disk_usage_system% which is above threshold"
else
  echo "Disk Usage for the system is $disk_usage_system% which is below threshold"
fi

if [[ $disk_usage_home -gt $home_threshold ]];then 
  echo "Disk Usage for /home is $disk_usage_home% which is above threshold"
else
  echo "Disk Usage for /home is $disk_usage_home% which is below threshold"
fi


