#基础镜像使用 centos:7
FROM cocoadel/otter-osbase:centos7

MAINTAINER ZWWang (zwwang_cool@163.com)


ARG OTTER_VERSION=4.2.18
ARG OTTER_DOWNLOAD_LINK="https://github.com/alibaba/otter/releases/download/otter-4.2.18/node.deployer-${OTTER_VERSION}.tar.gz"
ENV OTTER_HOME /usr/local/otter

ENV Xms 2048m
ENV Xmx 3072m
ENV Xmn 1024m
ENV PermSize 96m
ENV MaxPermSize 254m
ENV appName otter-node

#添加启动脚本
COPY docker-entrypoint.sh ${OTTER_HOME}/bin/
COPY start.sh ${OTTER_HOME}/bin/
COPY aria2c /usr/local/bin/

RUN \
    cd /tmp && \
    mkdir -p /usr/local/otter && \
    cd $OTTER_HOME && \
    wget ${OTTER_DOWNLOAD_LINK} && \
    tar -zxvf node.deployer-${OTTER_VERSION}.tar.gz && \
    rm -rf node.deployer-${OTTER_VERSION}.tar.gz && \
    mv /dockerize ${OTTER_HOME}/bin/dockerize && \
    chmod a+x ${OTTER_HOME}/bin/docker-entrypoint.sh && \
    chmod a+x /usr/local/bin/aria2c && \
    chmod a+x ${OTTER_HOME}/bin/start.sh && \
    chmod a+x ${OTTER_HOME}/bin/dockerize && \
    ln -s ${OTTER_HOME}/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint && \
    ln -s ${OTTER_HOME}/bin/start.sh /usr/local/bin/start && \
    ln -s ${OTTER_HOME}/bin/dockerize /usr/local/bin/dockerize && \
    yum clean all && \
    true

EXPOSE 8081 1099
# 配置容器启动后执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]
# 执行最终命令，启动 otter-manager
# CMD ["/dockerize","sh","-c","/usr/local/otter/bin/start.sh"]
CMD ["dockerize","start"]
