#!/bin/sh

path_current_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
echo "current dir path is : $path_current_dir"

while true;
do
echo -n "
**** root permission required ****
0. terminate
1. set container's resource
2. create container's network
3. remove certain network
4. remove ALL unused networks
5. set proxy(deprecated)
**********************************
--> select number(0~5):"
read op

case "$op" in
0)
    break
    ;;
1)
    docker ps -a
    echo -n "enter container name:"
    read container
    echo -n "set cpu usage in percentage(0.0~1.0) :"
    read cpu_percentage
    echo -n "set memory usage(ex. 1g) :"
    read memory
    echo -n "set total memory and swap usage(ex. 5g) :"
    read totalmemory
	docker update --cpus $cpu_percentage \
        --memory $memory --memory-swap $totalmemory $container
    ;;
2)
    docker network ls
    echo -n "set new network name :"
    read networkname
    docker network inspect bridge
    echo -n "Enable manual container attachment?(y/N) :"
    read attachable
    echo -n "restrict external access?(y/N) :"
    read internal
    echo -n "use ingress(=routing-mesh net)?(y/N) :"
    read ingress
    echo -n "use ipv6?(y/N) :"
    read ipv6
    echo -n "set gateway for master subnet(ex. 172.17.0.1) :"
    read gateway
    echo -n "set subnet in CIDR(ex. 172.17.0.0/16) :"
    read subnet
    echo -n "set network's scope(ex. local) :"
    read scope
    options=""
    if [ $attachable = "y" ] then
        $options="$options --attachable"
    fi
    if [ $internal = "y" ] then
        $options= "$options --internal"
    fi
    if [ $ingress = "y" ] then
        $options= "$options --ingress"
    fi
    if [ ipv6 = "y" ] then
        $options= "$options --ipv6"
    fi
    echo "all option is : $options"
    docker network create $options $networkname
    docker network ls
    docker network inspect $networkname
    ;;
3)
    docker network ls
    echo -n "set network name to remove :"
    read networkname
    docker network inspect $networkname
    echo -n "really remove?(y/N) :"
    read remove
    if [ $remove = "y" ] then
        docker network rm $networkname
    fi
    ;;
4)
    docker network prune
    ;;
5)
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



