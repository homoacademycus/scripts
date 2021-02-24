#!/bin/sh
#
# Copyright homoacademycus@github.com
# MIT Licnese
#
path_current_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
echo "current dir path is : $path_current_dir"

echo -n "set local git repository path :"
read localrepo
if [ ! -d "$localrepo" ]; then
    mkdir -p $localrepo
fi
cd $localrepo

while true;
do
echo -n "
**** local git repo rwx permission required ****
0. end this program
1. initialize local repository
2. set remote repository
3. manage branch
4. merge and update
5. roll back
6. remove staged file
7. rename staged file
************************************************
--> enter number(0~7) : "
read op

case $op in
0)
    break
    ;;
1)
    echo -n "set user email :"
    read email
    echo -n "set user name :"
    read name

    git config --global user.email $email
    git config --global user.name $name
    git config --list

    git init
    ls -al | grep .git
    ;;
2)
    . $path_current_dir/git_remoterepo.sh
    ;;
3)
    . $path_current_dir/git_branchManager.sh
    ;;
4)
    git add ./*
    echo -n "add commit message:"
    read message
    git commit -m "`date +%Y-%m-%d`/$message"
    git pull
    git add ./*
    git commit -m "`date +%Y-%m-%d`/$message"
    git push
    ;;
5)
    . $path_current_dir/git_rollback.sh
    ;;
6)
    echo -n "enter filename to remove :"
    read toremove
    git rm --cached $toremove
    ;;
7)
    echo -n "enter old filename :"
    read oldfile
    echo -n "enter new filename :"
    read newfile
    git mv $oldfile $newfile
    ;;
*)
  echo "please enter to continue.."
read enterKey;;
esac
done



