#!/bin/fish

if not ls ~/.anyenv >/dev/null 2>&1
    echo "install anyenv"
    git clone https://github.com/anyenv/anyenv ~/.anyenv
    set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
    anyenv install --init

    ## install anyenv-update plugin
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

    anyenv install nodenv
    anyenv install rbenv
    anyenv install goenv
else
    echo "update anyenv"
    anyenv update
end

## config.fishへの書き込み
set cmmd "status --is-interactive; and bass source (anyenv init -|psub)"
if not grep "$cmmd" ~/.config/fish/config.fish >/dev/null 2>&1
    echo "write to anyenv init setting to ~/.config/fish/config.fish"
    echo "" >> ~/.config/fish/config.fish
    echo "### for anyenv" >> ~/.config/fish/config.fish
    echo $cmmd >> ~/.config/fish/config.fish
    echo "" >> ~/.config/fish/config.fish
end 

