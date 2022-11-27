#!/bin/bash

sudo apt install git
sudo apt install curl
sudo apt install jq
sudo apt install zsh
sudo apt install unzip
sudo apt install direnv

# docker上のwebpackでエラーにならないようにするため
if [[ "fs.inotify.max_user_watches=524288" !=  `tail -1 /etc/sysctl.conf` ]]; then
    echo fs.inotify.max_user_watches=524288|sudo tee -a /etc/sysctl.conf && sudo sysctl -p;
else
    echo "already writed fs.inotify.max_user_watches=524288"
fi

# .zshrcのbaseファイルの作成
if [ ! -f ~/.zshrc ]; then
    curDir=`pwd`
    cat ${curDir}/zshrc/base.zshrc > ~/.zshrc

    ## 最終行を取得しておいて、あとで一番最後に追記
    last=`tail -1 ~/.zshrc`
    sed -i -e '$d' ~/.zshrc
    
    echo "iniDir=${curDir}" >> ~/.zshrc
    echo -n -e "\n" >> ~/.zshrc #空行の追加
    echo -n -e "\n" >> ~/.zshrc #空行の追加

    echo ${last} >> ~/.zshrc
else
    echo "already exist ~/.zshrc"
fi