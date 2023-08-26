#!/bin/bash

CUR_DIR=`pwd`

### install peco
if [ ${OS} == "mac" ]; then
    ${INSTALL_COMMAND} peco
else
    sudo apt install peco
fi


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

