#!/bin/sh

path_current_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
echo "current dir path is : $path_current_dir"

while true;
do
echo -n "
**** root permission required ****
0. terminate
1. initialize with daemon.json, seccomp.json
2. enable tls with openssl
3. set proxy(deprecated)
**********************************
--> select number(0~3):"
read op

case "$op" in
0)
    break
    ;;
1)
    cp $path_current_dir/../configFiles/container/dockerd.cfg /etc/docker/daemon.json
    cp $path_current_dir/../configFiles/container/seccomp_default.json /etc/docker/seccomp.json
    echo "--> /etc/docker/daemon.json"
    head /etc/docker/daemon.json
    echo "--> /etc/docker/seccomp.json"
    head /etc/docker/seccomp.json
    ;;
2)
    . $path_current_dir/genCerts.sh
    echo -n "set my tls private key file:"
    read myprivkey
    echo -n "set my tls cert file:"
    read mycert
    echo -n "set tls ca server cert file:"
    read cacert
    sudo dockerd --tlskey /home/$USERNAME/.docker/$myprivkey
    sudo dockerd --tlscert /home/$USERNAME/.docker/$mycert
    sudo dockerd --tlscacert /home/$USERNAME/.docker/$cacert
    sudo dockerd --tlsverify
    ;;

3)
    sudo mkdir -p /etc/systemd/system/docker.service.d
    sudo cp $path_current_dir/../configFiles/container/dockerd_http-proxy.cfg /etc/systemd/system/docker.service.d/http-proxy.conf
    sudo systemctl daemon-reload
    sudo systemctl restart docker
    sudo systemctl show docker
    ;;
*) 
    echo "$op is invalid. please enter to continue.."
    read enterKey
    ;;
esac
done



