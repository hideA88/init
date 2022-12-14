#!/bin/bash

## すでに存在している場合はインストールしない(whichコマンドの結果で存在確認)
which make2help >/dev/null 2>&1
if [ $? = 0 ]; then
    exit 0
fi 
${INSTALL_COMMAND} jq

CUR_DIR=`pwd`

## install make2help
mkdir -p ${CUR_DIR=}/tmp
cd ${CUR_DIR=}/tmp

ORG="Songmu"
REPO="make2help"

LATEST_VERSION=`curl -s https://api.github.com/repos/${ORG}/${REPO}/releases/latest| jq -r .tag_name`
echo $LATEST_VERSION


if [ $OS == "ubuntu" ]; then
  TARGET="make2help_${LATEST_VERSION}_darwin_arm64.zip"
else
  TARGET="make2help_${LATEST_VERSION}_linux_amd64.tar.gz"
fi

wget "https://github.com/${ORG}/${REPO}/releases/download/${LATEST_VERSION}/${TARGET}"

if [ $OS == "ubuntu" ]; then
  sudo unzip ${TARGET}
  cd "make2help_${LATEST_VERSION}_darwin_arm64"
else
  sudo tar xzvf ${TARGET}
  cd "make2help_${LATEST_VERSION}_linux_amd64"
fi

sudo chmod +x make2help 
sudo cp make2help /usr/local/bin

cd ${CUR_DIR}
sudo rm -rf ${CUR_DIR=}/tmp
