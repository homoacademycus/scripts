#!/usr/bin/env bash

# npm install -g, will install into ~/.npm-packages/lib/node_modules
# and link executable tools into ~/.npm-packages/bin, which is in your PATH.
echo -n "-------> current npm path :"
npm config get prefix

mkdir -p $HOME/.npm-global
npm config set prefix $HOME/.npm-global
echo -n "---------> changed npm path :"
npm config get prefix

echo "
N_PREFIX=$HOME/.npm-global
PATH=$N_PREFIX/bin:$PATH
NODE_PATH=$N_PREFIX/lib/node_modules

export N_PREFIX
export NODE_PATH
export PATH
" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo "changed PATH :"
echo $PATH
echo "\$N_PREFIX : $N_PREFIX"
sudo ln -s $NODE_PATH/npm/bin/npm-cli.js /usr/bin/npm

npm cache clean --force
#npm install -g npm
#npm install -g n
#n stable
