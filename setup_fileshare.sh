#!/bin/bash

##########################################
# Author: Ryan Ward
# Date: 01/04/2022
#
# Description: 
#  filepi is a setup script to install 
#  and use samba on a Raspberry Pi
##########################################

# Update and upgrade all packages

echo "Update and upgrade system packages:"
sudo apt-get update && sudo apt-get upgrade

echo "Install samba and related packages:"
sudo apt-get install samba

echo "Enter the path to the share you wish to use:"
read share_path

if [[ ! -d "$share_path" ]]
then
    echo "The path does not exist on your filesystem. Do you wish to create it? [Y/n]"
    read -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      sudo mkdir -p $share_path
      echo "Created share path..."
    fi
fi

