https://get.docker.com/rootless
sh ~/docker-rootless.sh

PATH=/home/`echo $USERNAME`/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/programmer/.local/bin:/home/programmer/bin

echo "
# docker-rootless
export PATH=/home/`echo $USERNAME`/bin:$PATH
export DOCKER_HOST=unix:///run/user/`echo $UID`/docker.sock
" >> ~/.bashrc
