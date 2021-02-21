#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
sshkey_dir="/home/$USERNAME/.ssh"

while true;
do
echo -n "
**** root permission required ****
0. end this program
1. generate key pair
2. copy public key to SSH server
3. remove public key for certain SSH server
4. set access permission
5. login to remote SSH terminal
6. send file via SSH terminal
**********************************
--> enter number(0~6) : "
read op

case $op in
0)
    break
    ;;
1)
    if [ ! -d $sshkey_dir ]; then
        mkdir -p $sshkey_dir
    fi
    echo -n "enter key name :"
    read keyname
    ssh-keygen -f $sshkey_dir/id_rsa_$keyname
    ls $sshkey_dir
    
    ;;
2)
    echo -n "enter user account :"
    read user
    echo -n "enter host address :"
    read host
    ssh-copy-id $user@$host
    ;;
3)
    echo -n "enter host address to remove key :"
    read host
    ssh-keygen -R $host
    ;;
4)
    sudo chown -R $USERNAME:$USERNAME $sshkey_dir
    sudo chmod -R 711 $sshkey_dir
    sudo chmod -R 511 `sudo ls $sshkey_dir | grep id_rsa_`
    ;;
5)
    echo -n "enter user account :"
    read user
    echo -n "enter host address :"
    read host
    echo -n "enter server's SSH port :"
    read serverport
    echo -n "enter selected private key :"
    read selectedkey
    ssh -v -i $sshkey_dir/$selectedkey -p $serverport $user@$host
    ;;
6)
    echo -n "enter user account :"
    read user
    echo -n "enter host address :"
    read host
    echo -n "enter server's SSH port :"
    read serverport
    echo -n "enter filepath to send :"
    read filetosend
    echo -n "enter save path on SSH server :"
    read savepath
    scp -p $serverport $filetosend $user@$host:$savepath
    ;;
*)
  echo "please enter to continue.."
read enterKey;;
esac
done
