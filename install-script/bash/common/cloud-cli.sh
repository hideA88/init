#!/bin/bash

CUR_DIR=`pwd`

### awscli install
function install_awscli() {
  mkdir -p ./tmp
  cd ./tmp
  
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip

  sudo ./aws/install $1 $2 $3 $4 $5
  cd ${CUR_DIR}
  sudo rm -rf ~/tmp
}

which aws >/dev/null 2>&1
if [  $? = 0 ]; then
  echo "install aws cli"
  install_awscli
else
  echo "update aws cli"
  install_awscli --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
fi


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

### gcloud install
sudo apt update 
sudo apt install apt-transport-https ca-certificates gnupg 

if [ ! -f /usr/share/keyrings/google-cloud-sdk.gpg ]; then
    mkdir -p ./tmp
    cd ./tmp

    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg --output apt-key.gpg
    gpg --no-default-keyring --keyring ./google-cloud-sdk.gpg --import apt-key.gpg
    sudo cp ./google-cloud-sdk.gpg /usr/share/keyrings/

    cd ${CUR_DIR}
    rm -rf ./tmp
else 
    echo "aleady installed google-cloud-sdk repo keyrings"
fi

if [ ! -f /etc/apt/sources.list.d/google-cloud-sdk.list ]; then
    echo "deb [signed-by=/usr/share/keyrings/google-cloud-sdk.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 
else
    echo "already added google-cloud-sdk repository"
fi

sudo apt update  
sudo apt install google-cloud-sdk 

### firebase cli

which firebase >/dev/null 2>&1
if [ $? = 0 ]; then
  curl -sL https://firebase.tools | bash
else
  curl -sL https://firebase.tools | upgrade=true bash
fi
