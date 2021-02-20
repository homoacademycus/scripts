echo -n "set keyfile name :"
read keyfile
#keypath = /etc/ssl/certs
openssl req -x509 -nodes \
	-newkey rsa:2048 \
	-keyout ./$keyfile.key \
	-out ./$keyfile.crt \
	-days 365

