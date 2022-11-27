#!/bin/zsh

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
    read "workPath?input workspace path: " 
    git config --global ghq.root $workPath/src
else
    echo "ghq already installed"
fi 

### install peco
sudo apt install peco

### zshrcに追記されていなければ追記する
if [ -z "`grep "###\sfor\speco" ~/.zshrc`" ]; then \
    ## 最終行を取得しておいて、あとで最終行についき
    last=`tail -1 ~/.zshrc`
    sed -i -e '$d' ~/.zshrc

    echo '### for peco' >> ~/.zshrc
    echo 'source ${iniDir}/zshrc/peco.zshrc' >> ~/.zshrc
    echo -n -e "\n" >> ~/.zshrc #空行の追加

    echo ${last} >> ~/.zshrc
    source ~/.zshrc
else 
    echo "already writing peco env"
fi

