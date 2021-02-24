mkdir /spark_home
cd /spark_home

wget https://mirror.navercorp.com/apache/spark/spark-3.0.0/spark-3.0.0-bin-hadoop3.2.tgz

tar -xzf ./spark*.tgz
rm ./spark*.tgz
mv spark* spark

echo '
export SPARK_HOME=/spark_home
export PATH=$PATH:$SPARK_HOME/bin
' >> ~/.bashrc

cp $SPARK_HOME/conf/slaves.template $SPARK_HOME/conf/slaves
echo 'slave1
slave2' >> $SPARK_HOME/conf/slaves

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


