#基础镜像使用 centos:7
FROM cocoadel/otter-osbase:centos7

MAINTAINER ZWWang (zwwang_cool@163.com)

ENV OTTER_HOME /usr/local/otter

ENV Xms 2048m
ENV Xmx 3072m
ENV Xmn 1024m
ENV PermSize 96m
ENV MaxPermSize 256m
ENV appName otter-manager

#添加启动脚本
COPY docker-entrypoint.sh ${OTTER_HOME}/bin/
COPY start.sh ${OTTER_HOME}/bin/
COPY stop.sh ${OTTER_HOME}/bin/

RUN \
    mkdir -p ${OTTER_HOME}/bin && \
    mkdir -p ${OTTER_HOME}/conf && \
    mkdir -p ${OTTER_HOME}/lib && \
    mkdir -p ${OTTER_HOME}/logs && \
    mkdir -p ${OTTER_HOME}/webapp && \
    mv /dockerize ${OTTER_HOME}/bin/dockerize && \
    chmod a+x ${OTTER_HOME}/bin/docker-entrypoint.sh && \
    chmod a+x ${OTTER_HOME}/bin/start.sh && \
    chmod a+x ${OTTER_HOME}/bin/stop.sh && \
    chmod a+x ${OTTER_HOME}/bin/dockerize && \
    ln -s ${OTTER_HOME}/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint && \
    ln -s ${OTTER_HOME}/bin/start.sh /usr/local/bin/start && \
    ln -s ${OTTER_HOME}/bin/stop.sh /usr/local/bin/stop && \
    ln -s ${OTTER_HOME}/bin/dockerize /usr/local/bin/dockerize && \
    yum clean all && \
    true

EXPOSE 8081 1099
# 配置容器启动后执行的命令
ENTRYPOINT ["docker-entrypoint"]
# 执行最终命令，启动 otter-manager
CMD ["dockerize","start"]
