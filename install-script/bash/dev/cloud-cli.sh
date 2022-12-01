#!/bin/bash

CUR_DIR=`pwd`

## awscli
mkdir -p ~/tmp
cd ~/tmp

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

cd ${CUR_DIR}
sudo rm -rf ~/tmp


## awsenv
mkdir -p ~/tmp
cd ~/tmp

AWSENV_VERSION=`curl -s https://api.github.com/repos/hideA88/awsenv/releases/latest| jq -r .tag_name`
wget "https://github.com/hideA88/awsenv/releases/download/${AWSENV_VERSION}/awsenv"

sudo chmod +x awsenv
sudo cp awsenv /usr/local/bin

cd ${CUR_DIR}
sudo rm -rf ~/tmp


## gcloud
sudo apt update 
sudo apt install apt-transport-https ca-certificates gnupg 

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - 
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 

sudo apt update  
sudo apt install google-cloud-sdk 
