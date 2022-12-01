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

## font
sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished
sudo apt install fontconfig

mkdir ./tmp
cd ./tmp
sourceZipUrl=`curl https://api.github.com/repos/adobe-fonts/source-han-code-jp/releases/latest | jq -r .zipball_url`

curl -L  $sourceZipUrl --output ./source-han-code-jp.zip
unzip source-han-code-jp.zip

mkdir ~/.fonts
cp ./*/*/*.otf ~/.fonts
cd ..
fc-cache -fv


