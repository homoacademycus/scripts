echo "
**** default ssl cert dir ****
linux : /etc/ssl/certs
docker : /home/$USERNAME/.docker
***********************
"
caname=rootCA
username=myService
echo -n "set cert dir path :"
read certdir
if [ -d "$certdir" ]; then
    rm -rf $certdir/*
fi
if [ ! -d "$certdir" ]; then
    mkdir $certdir
fi
ls $certdir
echo -n "set valid days :"
read validdays

while true;
do
echo -n "
**** root permission required ****
0. terminate
1. generate RSA privKey and X509 cert without CA
2. generate RSA privKey and X509 cert for CA
3. generate my privKey and get CSR cert from CA
4. get my crt from CA with my CSR cert
5. merge key files provided from CA
****************************************
--> select number:"
read op
case "$op" in
0)
    break
    ;;
1)
    openssl req -x509 -nodes \
        -newkey rsa:2048 \
        -keyout $certdir/mycert.key.pem \
        -out $certdir/mycert.crt.pem \
        -days $validdays
    ;;
2)
    echo -n "set ca name :"
    read caname
    openssl genrsa -out $certdir/$caname.key.pem 2048
    openssl req -x509 -new -nodes \
        -key $certdir/$caname.key.pem \
        -out $certdir/$caname.crt.pem \
        -days $validdays
    ;;
3)
    echo -n "set user name:"
    read username
    openssl genrsa -out $certdir/$username.key.pem 2048
    openssl req -new \
        -key $certdir/$username.key.pem \
        -out $certdir/$username.csr.pem
    ;;
4)
    echo $certdir
    openssl x509 -req -CAcreateserial \
        -in $certdir/$username.csr.pem \
        -out $certdir/$username.crt.pem \
        -CA $certdir/$caname.crt.pem \
        -CAkey $certdir/$caname.key.pem \
        -days $validdays
    ;;
5)
    cd $certdir | ls
    cat domain.crt.pem chain1.crt.pem chain2.crt.pem root.crt.pem > merged.domain.crt.pem
    ;;
*) 
    echo "$op is invalid. please enter to continue.."
    read enterKey
    ;;
esac
echo -n $certdir
ls $certdir
done
