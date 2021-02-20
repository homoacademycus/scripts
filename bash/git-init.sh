echo -n "set user email :"
read email
echo -n "set user name :"
read name

git config --global user.email $email
git config --global user.name $name
git remote -v

echo -n "set remote repository address :"
read addr

git remote add origin $addr
git remote set-url origin $addr

git add ./*
git commit -m `date +%Y-%m-%d`
git push --set-upstream origin master
git push


