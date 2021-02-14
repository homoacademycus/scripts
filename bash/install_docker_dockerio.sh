# docker official repo
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-sudo apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update

# install docker.io(client), docker(daemon)
sudo apt install -y docker
sudo apt install -y docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo docker version

# user permission
sudo groupadd docker
sudo usermod -aG docker `echo $USERNAME`
cat /etc/group | grep docker
sudo gpasswd -R docker

# move docker daemon root data dir
sudo lsof | grep /var/lib/docker
sudo systemctl stop docker
sudo mv /var/lib/docker /home/`echo $USERNAME`
sudo ln -s /home/`echo $USERNAME`/docker /var/lib/docker
sudo ls -al /var/lib/docker
sudo lsof | grep /var/lib/docker

# update setting
echo 'DOCKER_OPTS="-g /home/$USERNAME/docker"' >> /etc/default/docker
source /etc/default/docker

# enable on boot
sudo systemctl enable docker
