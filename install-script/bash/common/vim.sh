#!/bin/bash

CUR_DIR=`pwd`

## vim
sudo apt install vim
rm ~/.vimrc
ln -s $CUR_DIR/.vimrc ~/.vimrc
git config --global core.editor vim
mkdir ~/.vim
mkdir ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim > ~/.vim/colors




