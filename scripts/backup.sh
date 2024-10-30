#!/usr/bin/env bash

backup_dir="/path/to/what/you/want/to/backup"
backup_location="path/to/save/backups"

cd $backup_location
tar -czvf backup.$(date +%d-%m-%Y).tar.gz $backup_dir


# Tips
# c == compress, z == gzip, v == verbose, f == file (and should be at last)
# to decompress use tar -xvf name_of_the_backup

