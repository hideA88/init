#!/bin/zsh

if [ -z "`ls ~/.anyenv`" ]; then \
    git clone https://github.com/anyenv/anyenv ~/.anyenv
fi

### zshrcに追記されていなければ追記する
if [ -z "`grep "###\sfor\sanyenv" ~/.zshrc`" ]; then \
    ## 最終行を取得しておいて、あとで最終行についき
    last=`tail -1 ~/.zshrc`
    sed -i -e '$d' ~/.zshrc

    echo '### for anyenv' >> ~/.zshrc
    echo 'source ${iniDir}/zshrc/anyenv.zshrc' >> ~/.zshrc
    echo -n -e "\n" >> ~/.zshrc #空行の追加

    echo ${last} >> ~/.zshrc
    source ~/.zshrc
else 
    echo "already writing anyenv env"
fi

anyenv install --init

anyenv install nodenv
anyenv install rbenv
anyenv install goenv

#source ~/.zshrc

### install nodenv
#nodenv install ${NODE_VERSION}
#nodenv global ${NODE_VERSION}
#
#sudo mkdir /usr/local/opt
#sudo chown -R ${USER}:${USER} /usr/local/opt
#
### install rbenv
#sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
#rbenv install ${RUBY_VERSION}
#rbenv global ${RUBY_VERSION}
#
### install goenv
#goenv install ${GO_VERSION}
#goenv global ${GO_VERSION}
