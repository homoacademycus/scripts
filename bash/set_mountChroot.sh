#!/bin/bash

# mount -t type device dir
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t devpts devpts /dev/pts

# static information about encrypted filesystems
echo "# <target name>	<source device>		<key file>	<options>" >> /etc/crypttab
echo "ubuntu18.04 UUID=0bc4a none luks" >> /etc/crypttab
# discard option : araise leak about ciphertext-device(filesystem type, used space etc.)
# if the discarded blocks can be located easily on the device later

# create kernel-image
update-initramfs -c -k all

# update grub
update-grub

echo "please reboot..."

