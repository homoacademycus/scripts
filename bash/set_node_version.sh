#!/usr/bin/env bash

npm install -g n
n stable
echo -n "set node binary file path to activate :"
read nodepath

echo "back up current node binary file into ./backupnode.."
sudo mkdir -p ./backupnode
sudo mv /usr/bin/node ./backupnode

echo "adjust new node path.."
sudo ln -sf $nodepath /usr/bin/node
node --version
