#!/bin/bash

## vim
sudo apt install vim
CUR_DIR=`pwd`

if [ ! -e ~/.vimrc ]; then
    ln -s $CUR_DIR/.vimrc ~/.vimrc
    git config --global core.editor vim
else
    echo "aleady exist .vimrc"
fi

ls ~/.vim/colors >/dev/null 2>&1
if [ ! $? = 0 ]; then
    mkdir -p ~/.vim/colors
    curl -O https://raw.githubusercontent.com/jonathanfilip/vim-lucius/master/colors/lucius.vim > ~/.vim/colors/lucius.vim
else
    echo "already installed vim color scheme"
fi

# sudo したときに自分のvimrcを参照するようにする
sudo ls /root/.vimrc >/dev/null 2>&1
if [ ! $? = 0 ]; then
    sudo ln -s $CUR_DIR/.vimrc /root/.vimrc
fi

sudo ls /root/.vim >/dev/null 2>&1
if [ ! $? = 0 ]; then
    sudo ln -s ~/.vim/ /root/.vim/
fi
