#!/bin/bash


if [ ${OS} == "mac" ]; then
  #　mac は　Docker for Macで対応
  exit 0
fi

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

### docker install
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
