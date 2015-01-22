#!/bin/bash

ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${PASS})

if ( id ${USER} ); then
  echo "FATAL: User ${USER} already exists"
  exit 1
fi

useradd -d /ftp/${USER} -m -p ${ENC_PASS} -u 1000 -s /bin/sh ${USER}

exec vsftpd