#!/bin/bash

while true;
do
echo -n "
**** root permission required ****
1. initialize with daemon.json, seccomp.json
2. enable tls with openssl
3. container's resource
4. set proxy
**********************************
select number:"
read op

case "$op" in
1)
    cp ../configFiles/container/dockerd.cfg /etc/docker/daemon.json
    cp ../configFiles/container/seccomp_default.json /etc/docker/seccomp.json
    ;;
2)
    openssl ~/.docker/ca.pem
    openssl ~/.docker/cert.pem
    openssl ~/.docker/key.pem
    dockerd --tlsverify
    ;;
3)
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
4)
    mkdir -p /etc/systemd/system/docker.service.d
    cp ../configFiles/container/dockerd_http-proxy.cfg /etc/systemd/system/docker.service.d/http-proxy.conf
    systemctl daemon-reload
    systemctl restart docker
    systemctl show docker
    ;;
*) 
    echo "$op is invalid. please enter to continue.."
    read enterKey
    ;;
   esac
done



