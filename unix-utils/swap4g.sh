#!/bin/bash
sudo -s
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo -e "/swapfile   none    swap    sw    0   0" >> /etc/fstab
