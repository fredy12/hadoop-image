#!/bin/bash

OIFS=$IFS
IFS=','
datadirs=$HDFS_CONF_dfs_datanode_data_dir
for ddir in $datadirs
do
	datadir=`echo $ddir | perl -pe 's#file://##'`
	if [ ! -d $datadir ]; then
	    echo "Datanode name directory not found: $datadir"
		exit 2
	fi
done
IFS=$OIFS

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode
