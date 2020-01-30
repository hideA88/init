#!/bin/bash

## albert
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add - ;
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list";
sudo apt-get update; \
sudo apt-get install albert

## vim
sudo apt install vim
rm ~/.vimrc
ln -s $(shell pwd)/.vimrc ~/.vimrc
git config --global core.editor vim

## font
sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished

## direnv
sudo apt install direnv

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
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk