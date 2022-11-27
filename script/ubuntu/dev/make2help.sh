#!/bin/bash

## すでに存在している場合はインストールしない(whichコマンドの結果で存在確認)
which make2help >/dev/null 2>&1
if [ $? = 0 ]; then
    exit 0
fi 

CUR_DIR=`pwd`

## install make2help
mkdir -p ~/tmp
cd ~/tmp

ORG="Songmu"
REPO="make2help"

LATEST_VERSION=`curl -s https://api.github.com/repos/${ORG}/${REPO}/releases/latest| jq -r .tag_name`
echo $LATEST_VERSION

TARGET="make2help_${LATEST_VERSION}_linux_amd64.tar.gz"
wget "https://github.com/${ORG}/${REPO}/releases/download/${LATEST_VERSION}/${TARGET}"

sudo tar xzvf ${TARGET}
cd "make2help_${LATEST_VERSION}_linux_amd64"
sudo chmod +x make2help 
sudo cp make2help /usr/local/bin

cd ${CUR_DIR}
sudo rm -rf ~/tmp
