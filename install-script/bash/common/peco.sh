#!/bin/bash

CUR_DIR=`pwd`

### install ghq

# すでに存在している場合はインストールしない(whichコマンドの結果で存在確認)
which ghq >/dev/null 2>&1
if [ $? = 1 ]; then
    mkdir -p ~/tmp
    cd ~/tmp

    ORG="x-motemen"
    REPO="ghq"

    LATEST_VERSION=`curl -s https://api.github.com/repos/${ORG}/${REPO}/releases/latest| jq -r .tag_name`
    TARGET="${REPO}_linux_amd64.zip"
    wget "https://github.com/${ORG}/${REPO}/releases/download/${LATEST_VERSION}/${TARGET}"

    sudo unzip ${TARGET}
    cd "${REPO}_linux_amd64"
    sudo chmod +x ${REPO} 
    sudo cp ${REPO} /usr/local/bin

    cd ${CUR_DIR}
    sudo rm -rf ~/tmp
    read -p "input workspace path: " workPath
    git config --global ghq.root $workPath/src
else
    echo "ghq already installed"
fi 

### install peco
sudo apt install peco

### fish configに追記されていなければ追記する
if [ -z "`grep "###\sfor\speco" ~/.config/fish/config.fish`" ]; then \
    echo "write peco env to ~/.config/fish/config.fish"
    echo '### for peco' >> ~/.config/fish/config.fish
    echo 'function fish_user_key_bindings' >> ~/.config/fish/config.fish
    echo '  bind \cr peco_select_history #Ctrl+r でコマンド履歴' >> ~/.config/fish/config.fish
    echo '  bind \c] peco_select_ghq_repository #Ctrl+] でrepositoryのlist' >> ~/.config/fish/config.fish
    echo '  bind \ck peco_kill #Ctrl+k でprocessのkill' >> ~/.config/fish/config.fish 
    echo 'end' >> ~/.config/fish/config.fish
    echo -n -e "\n" >> ~/.config/fish/config.fish #空行の追加
else 
    echo "already writing peco env"
fi

