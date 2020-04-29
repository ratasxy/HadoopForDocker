FROM jsantillana/hadoop

COPY ./core-site.xml /usr/local/hadoop/etc/hadoop/
COPY ./hdfs-site.xml /usr/local/hadoop/etc/hadoop/
COPY ./mapred-site.xml /usr/local/hadoop/etc/hadoop/
COPY ./yarn-site.xml /usr/local/hadoop/etc/hadoop/

ADD ./run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870
EXPOSE 9864

CMD ["/bin/bash", "/run.sh"]