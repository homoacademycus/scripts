#!/usr/bin/env bash
echo "current npm path :"
npm config get prefix

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "current npm path :"
npm config get prefix

echo "
export PATH=~/.npm-global/bin:$PATH
export N_PREFIX=~/.local
" >> ~/.bash_profile
source ~/.bash_profile
echo $PATH
echo $N_PREFIX







