#!/bin/bash

#starshipのインストール
which starship >/dev/null 2>&1
if [ $? = 1 ]; then
    echo "install starship"
    if [ ${OS} == "mac" ]; then
        ${INSTALL_COMMAND} starship
    else
        sudo apt update
        ${INSTALL_COMMAND} fish
    fi
    cp ./config/starship.toml ~/.config/starship.toml
else
    if [ ${OS} == "mac" ]; then
        echo "update starship"
        ${UPDATE_COMMAND} starship
    else
        echo "instelled starship"
        //TODO implement update command.
    fi
fi

### fish configに追記されていなければ追記する
if [ -z "`grep "###\sfor\sstarship" ~/.config/fish/config.fish`" ]; then \
    echo "write starship env to ~/.config/fish/config.fish"
    echo '### for starship' >> ~/.config/fish/config.fish
    echo "starship init fish | source" >> ~/.config/fish/config.fish
    echo -n -e "\n" >> ~/.config/fish/config.fish #空行の追加
else 
    echo "already writing starship env"
fi