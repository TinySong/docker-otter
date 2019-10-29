#!/bin/bash 
otterNodeIdFile=${OTTER_HOME}/conf/nid
logback_configurationFile=${OTTER_HOME}/conf/logback.xml

JAVA_OPTS="-server -Xms2048m -Xmx3072m -Xmn1024m -XX:SurvivorRatio=2 -XX:PermSize=96m -XX:MaxPermSize=256m \
-Xss256k -XX:-UseAdaptiveSizePolicy -XX:MaxTenuringThreshold=15 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC \
-XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:+UseFastAccessorMethods \
-XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError"
JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8"
OTTER_OPTS="-DappName=otter-node -Ddubbo.application.logger=slf4j -Dlogback.configurationFile=$logback_configurationFile -Dnid=$(cat $otterNodeIdFile)"

if [ -e $otterNodeIdFile -a -e $logback_configurationFile ]
then 
	for i in ${OTTER_HOME}/lib/*;
	do CLASSPATH=$i:"$CLASSPATH";
	done
	CLASSPATH="${OTTER_HOME}/conf:$CLASSPATH";
 
	echo LOG CONFIGURATION : $logback_configurationFile
	echo Otter nodeId file : $otterNodeIdFile 
	echo CLASSPATH :$CLASSPATH
    java $JAVA_OPTS  $OTTER_OPTS -classpath .:$CLASSPATH com.alibaba.otter.node.deployer.OtterLauncher 1>>${OTTER_HOME}/logs/node/node.log 2>&1
else 
	echo "otterNodeIdFile file("$otterNodeIdFile") OR log configration file($logback_configurationFile) is not exist,please create then first!"
fi
