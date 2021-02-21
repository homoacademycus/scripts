#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
git branch -a

while true;
do
echo -n "
**** local git repo rwx permission required ****
0. terminate
1. generate new branch and checkin
2. generate new remote branch
3. enroll local branch under the remote branch
4. merge certain branch into current branch, auto-resolved confilcts cleanly
5. remove local branch
6. remove remote branch
************************************************
--> enter number(0~6) : "
read op

case $op in
0)
    break
    ;;
1)
    echo -n "enter new branch name :"
    read newbranch
    git branch $newbranch
    git checkout $newbranch
    ;;
2)
    echo -n "enter new remote branch name :"
    read newremotebranch
    git push origin $newremotebranch
    ;;
3)
    echo -n "enter local branch :"
    read localbranch
    echo -n "enter remote branch :"
    read remotebranch
    git push --set-upstream $remotebranch $localbranch
    ;;
4)
    echo -n "enter remote branch to merge :"
    read remote
    git merge -s ours $remote 
    
    ;;
5)
    git branch --delete
    ;;
6)
    git push --prune
    ;;
*)
  echo "please enter to continue.."
read enterKey
;;
esac
git branch -a
done
