#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
echo -n "****** reset current branch HEAD ******
1. rollback into staged(before commit), not remove files on working dir
2. rollback into unstaged(before add), not remove files on working dir
3. rollback into unstaged(before add), remove files on working dir(DANGER)
--> select options :
"
read sel
case $sel in
1)
    git reset --soft HEAD^
    ;;
2)
    git reset --mixed HEAD^
    ;;
3)
    git reset --hard HEAD^
    ;;
esac
git status
