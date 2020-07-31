#!/bin/bash
export LANG=en_US.UTF-8
base=${OTTER_HOME}
echo $base
otterNodeIdFile=$base/conf/nid
echo $otterNodeIdFile
logback_configurationFile=$base/conf/logback.xml

otterProperties=${OTTER_HOME}/conf/otter.properties

if [ ! -d $base/logs/node ] ; then 
	mkdir -p $base/logs/node
fi


echo "++++++++NID: " + $NID
if [ -z "$NID" ]; then
	if [ -f ${otterNodeIdFile} ];then
		NID=$(cat $otterNodeIdFile)
	fi
fi

echo "-----NID: " + $NID
if [ -n "$NID" ] ;  then
	echo $NID > $otterNodeIdFile
fi
echo "=====NID: " + $NID

if [ -n "$OTTER_HOME" ]; then
    cmd="sed -i -e 's|^otter.nodeHome.*$|otter.nodeHome = ${OTTER_HOME}|' ${otterProperties}"
    eval $cmd
	echo "OTTER_HOME: ${OTTER_HOME}"
fi

if [ -n "$ZOOKEEPER_SESSION_TIMEOUT" ]; then
    cmd="sed -i -e 's/^otter.zookeeper.sessionTimeout.*$/otter.zookeeper.sessionTimeout = ${ZOOKEEPER_SESSION_TIMEOUT}/' ${otterProperties}"
    eval $cmd
	echo "ZOOKEEPER_SESSION_TIMEOUT: ${ZOOKEEPER_SESSION_TIMEOUT}"
fi

if [ -n "$COMMUNICATION_PAYLOAD" ]; then
    cmd="sed -i -e 's/^otter.communication.payload.*$/otter.communication.payload = ${COMMUNICATION_PAYLOAD}/' ${otterProperties}"
    eval $cmd
	echo "COMMUNICATION_PAYLOAD: ${COMMUNICATION_PAYLOAD}"
fi

if [ -n "$COMMUNICATION_POOL_SIZE" ]; then
	cmd="sed -i -e 's/^otter.communication.pool.size.*$/otter.communication.pool.size = ${COMMUNICATION_POOL_SIZE}/' ${otterProperties}"
    eval $cmd
	echo "COMMUNICATION_POOL_SIZE: ${COMMUNICATION_POOL_SIZE}"
fi

if [ -n "$OTTER_MANAGER_ADDRESS" ]; then
	cmd="sed -i -e 's/^otter.manager.address.*$/otter.manager.address = ${OTTER_MANAGER_ADDRESS}/' ${otterProperties}"
    eval $cmd
	echo "OTTER_MANAGER_ADDRESS: ${OTTER_MANAGER_ADDRESS}"
fi

#打印命令
echo "$@"
#启动命令
exec "$@"




