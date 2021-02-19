docker run -itd --name test centos
docker container test start
docker cp $1 test:/

docker exec -it test /bin/bash
