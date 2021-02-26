#!/usr/bin/env bash

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile


