#!/bin/bash

which asdf >/dev/null 2>&1
if [ $? = 0 ]; then
        if [ ${OS} == "mac" ]; then
            ${INSTALL_COMMAND} asdf
        else 
            git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
            mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
        fi
else
        echo "already installed asdf"
fi

function install_asdf_plugin() {
        echo "install  $1 "

        asdf plugin add $1
        asdf install $1 latest
        asdf global $1 latest
}

if [ ${OS} == "mac" ]; then
        # m2 macだとasdf経由でインストールするバイナリが使えないため
        ${INSTALL_COMMAND} awscli
        ${INSTALL_COMMAND} google-cloud-sdk
        ${INSTALL_COMMAND} firebase-cli
else
        install_asdf_plugin awscli
        install_asdf_plugin gcloud
        install_asdf_plugin firebase
fi

install_asdf_plugin github-cli
install_asdf_plugin fzf
install_asdf_plugin ghq

install_asdf_plugin terraform
install_asdf_plugin golang
install_asdf_plugin nodejs
