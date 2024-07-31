#!/bin/bash

###########################################
# Author : Radheshyam
# date   : Wed Jul 31 20:40:40 IST 2024
###########################################

BACKUP_FILE=$1
BACKUP_DIR=/home/radhe/backup
BACKUP_FILE_NAME="$(date +%Y%m%d_%H%M%S)_$(basename $1).tar.gz"


echo "file name is here $BACKUP_FILE_NAME"

if [[ -f $1 ]]
then
            echo "process has started"
    else
                echo "Something went wrong"
                    exit 1
fi

if [[ ! -d $BACKUP_DIR ]]
then
            sudo mkdir -p $BACKUP_DIR
fi

sudo tar -czf $BACKUP_FILE_NAME $1

if [ $? -eq 0 ]
then
        sudo mv $(dirname $1)/$BACKUP_FILE_NAME $BACKUP_DIR
        echo "Backup has completed successfully"
else
        echo "Failed to backup"
        exit 1
fi