#!/usr/bin/env bash

echo -n "set github username :"
read $username
echo -n "set repository name :"
read repoName
git clone https://$username.github.io/$repoName.git
git branch -m gh-pages
echo "" > index.html
git add ./*
git commit -m 'initialize'
git remote add origin https://username.github.io/$repoName.git
git push -u origin gh-pages
git config --list


