#!/bin/bash

which fish >/dev/null 2>&1
if [ $? = 1 ]; then
    echo "install fish"
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish

    # default shellをzshに変更
    chsh -s $(which fish);
else
    echo "update fish"
    sudo apt install fish
fi
