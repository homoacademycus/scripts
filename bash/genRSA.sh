#!/bin/sh

openssl rsa \
    -in myPrivateKey.pem \
    -out myPublicKey.pem \
    -outform PEM \
    -pubout
