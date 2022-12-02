#!/bin/bash

sudo apt-get update

# すでに存在している場合はインストールしない(whichコマンドの結果で存在確認)
which docker >/dev/null 2>&1
if [ $? = 1 ]; then
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
fi

# dockerのリポジトリが追加されていなければ追加
if [ ! -f /usr/share/keyrings/docker.gpg ]; then
  echo "install docker repo keyring"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
fi

if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
  echo "already added docker repository"
fi

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# docker-compose install v2 
ORG="docker"
REPO="compose"
LATEST_VERSION=`curl -s https://api.github.com/repos/${ORG}/${REPO}/releases/latest| jq -r .tag_name`


function install_docker_compose() {
  mkdir -p ~/tmp
  cd ~/tmp

  echo "try install docker-compose $LATEST_VERSION"
  TARGET="docker-compose-linux-x86_64"
  wget "https://github.com/${ORG}/${REPO}/releases/download/${LATEST_VERSION}/${TARGET}"

  mv $TARGET docker-compose
  chmod +x docker-compose
  sudo cp docker-compose /usr/local/bin

  cd ${CUR_DIR}
  sudo rm -rf ~/tmp
}

# すでに存在している場合はインストールしない(whichコマンドの結果で存在確認)
which docker-compose >/dev/null 2>&1
if [ $? = 0 ]; then
  DC_VERSION=`docker-compose -v|awk '{print $4}'`
  if [ $LATEST_VERSION = $DC_VERSION ]; then
    # install skip
    echo "docker-compose latest version already installed"
  else
    DC_PATH=`which docker-compose`
    rm -rf $DC_PATH
    install_docker_compose
  fi
else
  install_docker_compose
fi

