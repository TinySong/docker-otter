#基础镜像使用 centos:7
FROM cocoadel/otter-osbase:centos7

MAINTAINER ZWWang (zwwang_cool@163.com)

#压缩包自行下载 https://github.com/alibaba/otter/releases
COPY manager.deployer-*.tar.gz /tmp
ENV OTTER_HOME /usr/local/otter

#添加启动脚本
COPY docker-entrypoint.sh /usr/local/bin/
COPY start.sh ${OTTER_HOME}/bin/

RUN \
    mkdir -p /usr/local/otter && \
    cd /tmp && \
    tar -zxvf manager.deployer-4.2.18.tar.gz -C ${OTTER_HOME} && \
    rm -rf manager.deployer-*.tar.gz && \
    chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    chmod a+x ${OTTER_HOME}/bin/start.sh && \
    true

EXPOSE 8081 1099
# 配置容器启动后执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]
# 执行最终命令，启动 otter-manager
CMD ["/dockerize","sh","-c","/usr/local/otter/bin/start.sh"]
