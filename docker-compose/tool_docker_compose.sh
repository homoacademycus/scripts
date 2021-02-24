#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
echo "please locate this script file under dir with docker-compose file"
path_current_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
echo -n "---->> this script is exected under dir : $path_current_dir"
echo "\n `ls $path_current_dir`"

echo -n "set docker compose file name(example.yaml) :"
read filename
echo -n "set log level(debug for develop, info for production) :"
read level

echo "---->> copy env to .env"
cp $path_current_dir/env $path_current_dir/.env
head $path_current_dir/.env

while true;
do
echo -n "
**** docker permission required ****
0. end this program
1. start all services on stack
2. start certain service on stack
3. down all services on stack
4. down certain service on stack
5. stop and remove all docker containers
6. build certain service on stack
**********************************
--> enter number(0~6) : "
read op

cat $path_current_dir/$filename

case $op in
0)
    echo "finish this program.."
    break
    ;;
1)
    docker-compose --log-level $level --file $filename up -d 2>&1
    docker ps -a
    ;;
2)
    echo -n "set service name on docker-compose stack :"
    read certainServiceName
    docker-compose --log-level $level --file $filename up -d $certainServiceName 2>&1
    docker ps -a
    ;;
3)
    docker-compose --file $filename down
    docker ps -a
    ;;
4)
    echo -n "set service name on docker-compose stack :"
    read certainServiceName
    docker-compose --file $filename down $certainServiceName
    docker ps -a
    ;;
5)
    echo "stop all containers and delete"
    docker container stop $(docker ps -aq)
    docker container rm $(docker ps -aq)
    docker ps -aq
    ;;
6)
    echo -n "set service name on docker-compose stack :"
    read certainServiceName
    docker-compose --file $filename build --parallel $certainServiceName
    ;;
*)
  echo "please enter to continue.."
read enterKey;;
esac
done

