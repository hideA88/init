#!/bin/bash

## vim
sudo apt install vim

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



