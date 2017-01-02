#!/bin/sh
sudo -i
fdisk -l
mount /dev/sda5 /mnt
grub-install --root-directory=/mnt/ /dev/sda
