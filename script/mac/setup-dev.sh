#!/bin/bash

## albert

## vim
brew install vim
rm ~/.vimrc
ln -s $(shell pwd)/.vimrc ~/.vimrc
git config --global core.editor vim

## font
sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished

## direnv
brew install direnv

## ansible
pip3 install ansible

## npm lib
npm install -g yarn
npm install -g webpack
npm install -g serverless
npm install -g amplify
npm install -g create-react-app
npm install -g npm-check-updates
npm install -g gitbook-cli
npm install -g prettier
npm install -g eslint
npm install -g typescript

## ssh key
ln -s ~/OneDrive/init/config/ssh ~/.ssh
chmod 600 ~/.ssh/*

## awscli
pip install awscli
ln -s ~/OneDrive/init/config/aws ~/.aws

## awsenv
git clone https://github.com/buzztaiki/awsenv.git ~/lib/awsenv
sudo cp ~/lib/awsenv/awsenv /usr/local/bin


## gcloud
TODO

