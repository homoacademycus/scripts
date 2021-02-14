git config --global user.email "$1"
git config --global user.name "$2"
git remote -v

git remote add origin $3
git remote set-url origin $3

git add ./*
git commit -m `date +%Y-%m-%d`
git push --set-upstream origin master
git push


