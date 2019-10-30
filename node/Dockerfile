#基础镜像使用 centos:7
FROM cocoadel/otter-osbase:centos7

MAINTAINER ZWWang (zwwang_cool@163.com)


ARG OTTER_VERSION=4.2.18
ARG OTTER_DOWNLOAD_LINK="https://github.com/alibaba/otter/releases/download/otter-4.2.18/node.deployer-${OTTER_VERSION}.tar.gz"
ARG ARIA2_DOWNLOAD_LINK="https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0-aarch64-linux-android-build1.zip"
ENV OTTER_HOME /usr/local/otter

#添加启动脚本
COPY docker-entrypoint.sh /usr/local/bin/
COPY start.sh ${OTTER_HOME}/bin/

RUN \
    cd /tmp && \
    wget ${ARIA2_DOWNLOAD_LINK} && \
    unzip  aria2-1.35.0-aarch64-linux-android-build1.zip && \
    cp aria2-1.35.0-aarch64-linux-android-build1/aria2c /usr/bin/aria2c && \
    rm -rf aria2-1.35.0-aarch64-linux-android-build1.zip && \
    mkdir -p /usr/local/otter && \
    cd $OTTER_HOME && \
    wget ${OTTER_DOWNLOAD_LINK} && \
    tar -zxvf node.deployer-${OTTER_VERSION}.tar.gz && \
    rm -rf node.deployer-${OTTER_VERSION}.tar.gz && \
    chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    chmod a+x ${OTTER_HOME}/bin/start.sh && \
    yum clean all && \
    true

EXPOSE 8081 1099
# 配置容器启动后执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]
# 执行最终命令，启动 otter-manager
CMD ["/dockerize","sh","-c","/usr/local/otter/bin/start.sh"]
