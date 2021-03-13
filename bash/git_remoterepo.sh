#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
echo -n "set git protocol

1. ssh://git@github.com:user/reponame.git
2. git://github.com:user/reponame.git
3. https://github.com/user/reponame.git
4. file://path/to/repote/repo.git
5. set remote branch ref

* github url


--> select number (1~4) :
"
read sel
case $sel in
1)
    echo -n "enter user account :"
    read user
    echo -n "enter remote repo name :"
    read remote
    remoteurl="ssh://git@github.com:$user/$remote.git"
    ;;
2)
    echo -n "enter user account :"
    read user
    echo -n "enter remote repo name :"
    read remote
    remoteurl="git://github.com:$user/$remote.git"
    ;;
3)
    echo -n "enter user account :"
    read user
    echo -n "enter remote repo name :"
    read remote
    remoteurl="https://github.com/$user/$remote.git"
    ;;
4)
    echo -n "enter file path :"
    read filepath
    remoteurl="file://$filepath"
    ;;
5)
    echo -n "enter remote branch ref(defualt main):"
    read refname
    git add ./*
    git commit -m 'set remote repo..'
    git push --set-upstream origin $refname
    ;;
*)
    echo "you typed wrong input. please try again."
    break
    ;;
esac
git remote add origin $remoteurl
git remote set-url origin $remoteurl
git remote -v

