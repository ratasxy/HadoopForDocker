FROM openjdk:8

RUN apt-get update \
    && apt-get install -y openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && cd /opt \
    && wget https://downloads.apache.org/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz \
    && tar xzf hadoop-3.2.1.tar.gz \
    && mv hadoop-3.2.1 /usr/local/ \
    && rm -rf hadoop-3.2.1.tar.gz \
    && mv /usr/local/hadoop-3.2.1 /usr/local/hadoop \
    && adduser --disabled-password --gecos "" hadoop \
    && mkdir /usr/local/hadoop/logs \
    && chown -R hadoop /usr/local/hadoop/logs \
    && chown -R hadoop /opt \
    && echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf


COPY .bashrc /root/.bashrc

USER hadoop
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY .bashrc /home/hadoop/.bashrc
COPY .bashrc /root/.bashrc

EXPOSE 22
# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000 9820
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088 8020
#Other ports
EXPOSE 49707 2122

USER root