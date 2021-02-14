#!/bin/sh
apt install -y openjdk-11-jre
apt install -y openjdk-11-jdk

mkdir -p /opt/jdk
cp -rf ./packages/jdk* /opt/jdk
cd /opt/jdk
tar -zxf ./jdk*
rm -rf ./jdk*gz
mv jdk* /opt/jdk1.8.0
rm -rf /opt/jdk

update-alternatives --install /usr/bin/java java /opt/jdk1.8.0/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0/bin/javac 100
update-alternatives --config java
update-alternatives --config javac
update-alternatives --display java | sudo update-alternatives --display javac
java -version | javac -version

echo 'JAVA_HOME="/opt/jdk1.8.0"' >> /etc/environment
echo 'JRE_HOME="/opt/jdk1.8.0/jre"' >> /etc/environment

source /etc/environment
echo $JAVA_HOME

