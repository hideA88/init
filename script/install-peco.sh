#!/bin/zsh

PECO_VERSION=0.5.6

## install ghq
go get github.com/motemen/ghq
git config --global ghq.root $GOPATH/src


## install peco
mkdir -p ~/tmp
cd ~/tmp
wget "https://github.com/peco/peco/releases/download/v${PECO_VERSION}/peco_linux_386.tar.gz"
sudo tar xzvf peco_linux_386.tar.gz
cd peco_linux_386
sudo chmod +x peco
sudo cp peco /usr/local/bin
cd ~
sudo rm -rf ~/tmp
