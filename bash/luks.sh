#!/bin/sh

apt-get install -y cryptsetup
#apt-get install -y cryptsetup-bin

# formatDisk
cryptsetup luksFormat \
	--cipher aes-xts-plain64 \
	--key-size 512 \
	--hash sha512 \
	--use-random \
	--verify-passphrase $1

# nameToMapping
# $1 = /dev/sdb3
# $2 = luksDeviceName
echo "open luks with device mapper"
cryptsetup luksOpen $1 $2

echo "create physical volume with partition"
pvcreate /dev/mapper/$2

echo "create volume groups with physical volumes"
vgcreate vg-$2 /dev/mapper/$2
