FTP server
==========

This repo defines a docker image for an ftp server. It is based on vsftpd. You can configure the ftp user and password using environment variables $USER and $PASS, and mount a volume "/ftp" where files will be put. You will probably also want port forwards to 20 and 21:

	docker run -p 2021:21 -p 2020:20 -e "USER=myuser" -e "PASS=verysecretpwd" --volumes-from <data_volume>  -d emilybache/vsftpd-server:latest

Then you should be able to ftp to your server:

	ftp ftp://myuser:verysecretpwd@<docker hostname>:2021