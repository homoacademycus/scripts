docker commit test $1
docker container stop test
docker container rm test
docker ps -a
docker images

