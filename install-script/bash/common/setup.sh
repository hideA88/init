#!/bin/bash

sudo apt install git
sudo apt install curl
sudo apt install jq
sudo apt install unzip
sudo apt install direnv

# docker上のwebpackでエラーにならないようにするため
if [[ "fs.inotify.max_user_watches=524288" !=  `tail -1 /etc/sysctl.conf` ]]; then
    echo fs.inotify.max_user_watches=524288|sudo tee -a /etc/sysctl.conf && sudo sysctl -p;
else
    echo "already writed fs.inotify.max_user_watches=524288"
fi


## install font
sudo apt install fontconfig

### Ricttyのインストール
sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished

### SourceHanCodeJP(源ノ各ゴシック)のインストール
ls ~/.fonts/SourceHanCodeJP* >/dev/null 2>&1
if [ ! $? = 0]; then
    mkdir ./tmp
    cd ./tmp
    sourceZipUrl=`curl https://api.github.com/repos/adobe-fonts/source-han-code-jp/releases/latest | jq -r .zipball_url`

    curl -L  $sourceZipUrl --output ./source-han-code-jp.zip
    unzip source-han-code-jp.zip

    mkdir ~/.fonts
    cp ./*/*/*.otf ~/.fonts
    rm -rf ./tmp
    cd ..

    # fontのキャッシュクリア
    fc-cache -fv
else
    echo "already installed SourceHanCodeJP"
fi
