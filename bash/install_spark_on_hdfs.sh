apt update

# JAVA
apt install -y openjdk-8-jdk
ls /usr/lib/jvm

# Hadoop
mkdir /hadoop_home
cd /hadoop_home
wget https://mirror.navercorp.com/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz
tar -xvzf hadoop*.tar.gz
rm ./hadoop*.tar.gz

# spark
mkdir /spark_home
cd /spark_home

wget https://mirror.navercorp.com/apache/spark/spark-3.0.0/spark-3.0.0-bin-hadoop3.2.tgz

tar -xzf ./spark*.tgz
rm ./spark*.tgz
mv spark* spark

# envar
echo '
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/hadoop_home/hadoop3.2.1
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin' >> ~/.bashrc

echo '
export SPARK_HOME=/spark_home
export PATH=$PATH:$SPARK_HOME/bin
' >> ~/.bashrc

source ~/.bashrc

# config files
cp $SPARK_HOME/conf/slaves.template $SPARK_HOME/conf/slaves
echo 'new_slave1
new_slave2' >> $SPARK_HOME/conf/slaves

cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
echo '
HADOOP_CONF_DIR=$HADOOP_CONF_DIR
YARN_CONF_DIR=$HADOOP_CONF_DIR
SPARK_DRIVER_MEMORY=1g
SPARK_EXECUTOR_MEMORY=1g
SPARK_EXECUTOR_CORES=1
' >> $SPARK_HOME/conf/spark-env.sh

cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
exho '
spark.master                     spark://master:7077
spark.eventLog.enabled           true
spark.eventLog.dir               hdfs://master:8021/event-log
spark.serializer                 org.apache.spark.serializer.KryoSerializer
spark.driver.memory              5g
spark.executor.extraJavaOptions  -XX:+PrintGCDetails -Dkey=value -Dnumbers="one two three"
' >> $SPARK_HOME/conf/spark-defaults.conf

cp $SPARK_HOME/conf/log4j.properties.template $SPARK_HOME/conf/log4j.properties

# ssh-client
apt install -y ssh

# ssh-parallel hosts
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


