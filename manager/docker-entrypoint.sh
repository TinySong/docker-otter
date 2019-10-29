#!/bin/bash
export LANG=en_US.UTF-8
otterProperties=${OTTER_HOME}/conf/otter.properties

if [ ! -d ${OTTER_HOME}/logs ]; then
	mkdir -p ${OTTER_HOME}/logs
fi

if [ -n ${DOMAIN_NAME} ]; then
    cmd="sed -i -e 's/^otter.domainName.*$/otter.domainName = ${DOMAIN_NAME}/' ${otterProperties}"
    eval $cmd
	echo "DOMAIN_NAME: ${DOMAIN_NAME}"
fi

if [ -n ${OTTER_PORT} ]; then
    cmd="sed -i -e 's/^otter.port.*$/otter.port = ${OTTER_PORT}/' ${otterProperties}"
    eval $cmd
	echo "OTTER_PORT: ${OTTER_PORT}"
fi

if [ -n ${OTTER_MANAGER_MYSQL} ]; then
    cmd="sed -i -e 's/^otter.database.driver.url.*$/otter.database.driver.url = jdbc:mysql:\/\/${OTTER_MANAGER_MYSQL}\/otter/' ${otterProperties}"
    eval $cmd
    echo "OTTER_MANAGER_MYSQL: ${OTTER_MANAGER_MYSQL}"
fi

if [ -n ${MYSQL_USER} ]; then
    cmd="sed -i -e 's/^otter.database.driver.username.*$/otter.database.driver.username = ${MYSQL_USER}/' ${otterProperties}"
    eval $cmd
    echo "MYSQL_USER: ${MYSQL_USER}"
fi

if [ -n ${MYSQL_USER_PASSWORD} ]; then
    cmd="sed -i -e 's/^otter.database.driver.password.*$/otter.database.driver.password = ${MYSQL_USER_PASSWORD}/' ${otterProperties}"
    eval $cmd
    echo "MYSQL_USER_PASSWORD: ${MYSQL_USER_PASSWORD}"
fi

if [ -n ${COMMUNICATION_MANAGER_PORT} ]; then
    cmd="sed -i -e 's/^otter.communication.manager.port.*$/otter.communication.manager.port = ${COMMUNICATION_MANAGER_PORT}/' ${otterProperties}"
    eval $cmd
    echo "COMMUNICATION_MANAGER_PORT: ${COMMUNICATION_MANAGER_PORT}"
fi

if [ -n ${ZOOKEEPER_CLUSTER_DEFAULT} ]; then
    cmd="sed -i -e 's/^otter.zookeeper.cluster.default.*$/otter.zookeeper.cluster.default = ${ZOOKEEPER_CLUSTER_DEFAULT}/' ${otterProperties}"
    eval $cmd
    echo "ZOOKEEPER_CLUSTER_DEFAULT: ${ZOOKEEPER_CLUSTER_DEFAULT}"
fi

#打印命令
echo "$@"
#启动命令
exec "$@"




