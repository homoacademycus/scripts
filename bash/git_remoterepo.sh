#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
echo -n "set git protocol

1. ssh://user@host.com
2. git://host.com
3. https://host.com
4. file://

* github url
git@github.com:user/reponame.git

--> select number (1~4) :
"
read sel
case $sel in
1)
    echo -n "enter user account :"
    read user
    echo -n "enter host domain name :"
    read domain
    remoteurl="ssh://$user@$domain"
    ;;
2)
    echo -n "enter host domain name :"
    read domain
    remoteurl="git://$domain"
    ;;
3)
    echo -n "enter host domain name :"
    read domain
    remoteurl="https://$domain"
    ;;
4)
    echo -n "enter file path :"
    read filepath
    remoteurl="file://$filepath"
    ;;
*)
    echo "you typed wrong input. please try again."
    break;
esac
git remote add origin $remoteurl
git remote set-url origin $remoteurl
git remote -v
git add ./*
git commit -m 'initialized'
git push --set-upstream origin master
