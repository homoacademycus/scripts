#!/usr/bin/env bash
<<<<<<< HEAD
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





=======

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile
>>>>>>> 87bc40fbe1d6061e0eb72c0d296382b9d8f51ff6


