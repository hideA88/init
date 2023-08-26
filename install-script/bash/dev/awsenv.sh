#!/bin/bash

CUR_DIR=`pwd`

### awsenv install
LATEST_VERSION=`curl -s https://api.github.com/repos/hideA88/awsenv/releases/latest| jq -r .tag_name`

function install_awsenv() {
  echo "install awsenv"
  mkdir -p ./tmp
  cd ./tmp
  wget "https://github.com/hideA88/awsenv/releases/download/${LATEST_VERSION}/awsenv"

  sudo chmod +x awsenv
  sudo cp awsenv /usr/local/bin

  cd ${CUR_DIR}
  sudo rm -rf ~/tmp
}


which awsenv >/dev/null 2>&1
if [ $? = 0 ]; then
  CUR_VERSION=`awsenv --version 2>&1 | head -1 | jq -r .msg | sed -e "s/version=//"`
  if [ $LATEST_VERSION = $CUR_VERSION ]; then
    # install skip
    echo "awsenv latest version already installed"
  else
    CUR_PATH=`which awsenv`
    sudo rm -rf $CUR_PATH
    install_awsenv
  fi
else
  install_awsenv
fi
