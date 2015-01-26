FTP server
==========

This repo defines a docker image for an ftp server. It is based on vsftpd. You can configure the ftp user and password using environment variables $USER and $PASS, and mount a volume "/ftp" where files will be put. You will probably also want some port forwards:

	docker run -p 2021:21 -p 2020:20 -p 12020:12020 -p 12021:12021 -p 12022:12022 -p 12023:12023 -p 12024:12024 -p 12025:12025  -e "USER=myuser" -e "PASS=verysecretpwd" -d  --volumes-from <data_volume>  -d emilybache/vsftpd-server:latest

Then you should be able to ftp to your server:

	ftp ftp://myuser:verysecretpwd@<docker hostname>:2021