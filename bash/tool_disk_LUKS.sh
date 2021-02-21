#!/bin/sh
#
# Copyright homoacademycus@github.com | MIT Licnese
#
path_script_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
echo "script's dir path is : $path_script_dir"
lsblk
echo -n "set LUKS disk paratition(/dev/sdb0) :"
read luksDisk
echo -n "set LUKS device name for mapping :"
read luksDeviceName

while true;
do

echo -n "
**** high root permission required ****
0. end this program
1. make disk(partition) into LUKS device
2. open LUKS disk with device mapper
3. create file system on LUKS disk
4. mount LUKS file sytem
5. umount LUKS file system
6. close LUKS disk (clear device mapper)
7. change LUKS password
***************************************
--> enter number(0~5) : "
read op

case $op in
0)
    echo "finish this program.."
    break
    ;;
1)
    cryptsetup luksFormat \
	    --cipher aes-xts-plain64 \
	    --key-size 512 \
	    --hash sha512 \
	    --use-random \
	    --verify-passphrase $luksDisk \
        --verbose
    ;;
2)
    cryptsetup luksOpen $luksDisk $luksDeviceName
    ls /dev/mapper | grep $luksDeviceName
    ;;
3)
    echo -n "set file system type(ext4) :"
    read fstype
    sudo mkfs.$fstype -L persistence /dev/mapper/$luksDeviceName
    ;;
4)
    echo -n "set mount path :"
    read mountpath
    if [ ! -d "$mountpath" ]; then
        sudo mkdir $mountpath
    fi
    sudo mount /dev/mapper/$luksDeviceName $mountpath
    sudo chown -R root:$USERNAME $mountpath
    sudo chmod -R 750 $mountpath
    sudo ls -al $mountpath
    ;;
5)
    lsblk | grep crypt
    echo -n "set umount path :"
    read umountpath
    sudo umount $umountpath
    ;;
6)
    sudo cryptsetup luksClose /dev/mapper/$luksDeviceName
    ls /dev/mapper | grep $luksDeviceName
    ;;
7)
    sudo cryptsetup luksChangeKey \
	    --cipher aes-xts-plain64 \
	    --key-size 512 \
	    --hash sha512 \
	    --use-random \
	    --verify-passphrase $luksDisk \
        --verbose
    ;;
*)
  echo "please enter to continue.."
read enterKey;;
esac
done

