#!/bin/zsh

NODE_VERSION=$1
RUBY_VERSION=$2
PYTHON_VERSION=$3
GO_VERSION=$4


if [ -z "`ls ~/.anyenv`" ]; then \
    git clone https://github.com/anyenv/anyenv ~/.anyenv
fi

#echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
eval "$(anyenv init -)"

anyenv install --init

anyenv install nodenv
anyenv install pyenv
anyenv install rbenv
anyenv install goenv
anyenv install tfenv

source ~/.zshrc

## install nodenv
nodenv install ${NODE_VERSION}
nodenv global ${NODE_VERSION}


sudo mkdir /usr/local/opt
sudo chown -R ${USER}:staff /usr/local/opt

## install pyenv
## これやらないとinstallコマンドが表示されない
brew install libffi-dev
sudo ~/.anyenv/envs/pyenv/plugins/python-build/install.sh
pyenv install ${PYTHON_VERSION}
pyenv global  ${PYTHON_VERSION}

## install rbenv
brew install libssl-dev libreadline-dev zlib1g-dev
rbenv install ${RUBY_VERSION}
rbenv global ${RUBY_VERSION}

## install goenv
goenv install ${GO_VERSION}
goenv global ${GO_VERSION}


## install tfenv
tfenv install