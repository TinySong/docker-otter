#基础镜像使用 centos:7
FROM centos:7

COPY jre /opt/jre
COPY dockerize /dockerize
ENV JAVA_HOME /opt/jre
ENV PATH $JAVA_HOME/bin:$PATH
# install system
RUN \
    /bin/cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum install -y man && \
    yum install -y dstat && \
    yum install -y unzip && \
    yum install -y nc && \
    yum install -y tar && \
    yum install -y which && \
    yum install -y wget && \
    yum install -y perl && \
    yum install -y file && \
    yum install -y cronie && \
    sed -i '/session required pam_loginuid.so/d' /etc/pam.d/crond && \
    chmod -R a+x /opt/jre && \
    source /etc/profile && \
    chmod -R a+x /dockerize && \
    true

CMD ["java -version"]