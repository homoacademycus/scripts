#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
while true;
do
echo -n "
**** docker permission required ****
0. end this program
1. store certain docker container into docker image
2. save docker image into gzip file
3. load gzip file into docker image
4. delete docker image
5. stop and delete all docker container
**********************************
--> enter number(0~5) : "
read op

case $op in
0)
    echo "finish this program.."
    break
    ;;
1)
    docker ps -a
    echo -n "enter docker container ID to save: "  
    read containerID
    echo -n "enter new image name:  "
    read imagename
    docker commit $containerID $imagename:`date +%Y-%m-%d`
    echo "saved container into docker image.."
    ;;
2)
    docker images
    echo -n "enter docker image file name :"
    read name
    echo -n "enter dir path to save docker image into :"
    read imagedir
    docker save $name | gzip -c 1> $imagedir/$name.tgz
    echo "stored docker image into gzip file.."
    ;;
3)
    echo -n "enter dir path to load docker image from :"
    ls $imagedir
    echo -n "enter gzip filename to load :"
    read imagefilename
    gunzip -c $imagedir/$imagefilename | docker load
    echo "loaded gzip file into docker image.."
    ;;
4)
    docker images
    echo -n "enter image name or image ID to delete: "
    read imagename
    docker rmi $imagename
    echo "deleted image $imagename"
    ;;
5)
    echo "stop all containers and delete"
    docker container stop $(docker ps -aq)
    docker container rm $(docker ps -aq)
    docker ps -aq
    ;;
*)
  echo "please enter to continue.."
read enterKey;;
esac
done

