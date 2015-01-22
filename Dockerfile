FROM ubuntu:14.04
MAINTAINER Emily Bache

ENV USER ftpuser
ENV PASS changeme

RUN apt-get update && \
    apt-get install -y vsftpd && \
    mkdir -p /var/run/vsftpd/empty

ADD start.sh /usr/local/bin/start.sh
ADD vsftpd.conf /etc/vsftpd.conf

RUN mkdir /ftp

VOLUME ["/ftp"]

EXPOSE 20 21
EXPOSE 12020 12021 12022 12023 12024 12025

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]