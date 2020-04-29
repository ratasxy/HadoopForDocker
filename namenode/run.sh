#!/bin/bash

/etc/init.d/ssh start
source /root/.bashrc
#sleep infinity

if [ ! -f /hdfsformated ]; then
    $HADOOP_HOME/bin/hdfs namenode -format
    touch /hdfsformated
fi

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
sleep infinity