apt update

# ssh-client
apt install -y ssh

ssh-parallel hosts
apt install -y pdsh
echo "ssh" > /etc/pdsh/rcmd_default

# ssh-server
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bk
echo 'Include /etc/ssh/sshd_config.d/*.conf
Subsystem sftp /usr/lib/openssh/sftp-server
#Port 22
#UseDNS no
PubkeyAuthentication yes
PasswordAuthentication no
PermitRootLogin prohibit-password
UsePAM yes
AcceptEnv LANG LC_*
X11Forwarding no
PrintMotd no
MaxSessions 6
MaxAuthTries 3' > /etc/ssh/sshd_config

# JAVA
apt install -y openjdk-8-jdk
ls /usr/lib/jvm

# Hadoop
mkdir /hadoop_home
cd /hadoop_home
wget https://mirror.navercorp.com/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz
tar -xvzf hadoop*.tar.gz
rm ./hadoop*.tar.gz

# envar
echo '
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/hadoop_home/hadoop3.2.1
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin' >> ~/.bashrc

source ~/.bashrc







