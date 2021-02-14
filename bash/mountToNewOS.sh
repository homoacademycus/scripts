#!/bin/bash

# ls /dev/vg-ubuntu18.04
# 	home  root  swap  usr
mount /dev/vg-$1/root /mnt
mount /dev/vg-$1/usr /mnt/usr

# Remount part of the file hierarchy somewhere else
# mount --bind olddir newdir
mount --bind /dev /mnt/dev
mount --bind /run/lvm /mnt/run/lvm
# sudo ls /run/lvm
# lvmetad.socket	lvmpolld.socket

mount /dev/sdb2 /mnt/boot
mount /dev/sdb1 /mnt/boot/efi

# access the installed OS
chroot /mnt
. ./mountChroot.sh


