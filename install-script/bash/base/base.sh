#!/bin/bash

${INSTALL_COMMAND} git
${INSTALL_COMMAND} curl
${INSTALL_COMMAND} jq
${INSTALL_COMMAND} unzip
${INSTALL_COMMAND} direnv

# additional tools

if [ ${OS} == "mac" ]; then
    ${INSTALL_COMMAND} exa     #lsの代わり
    ${INSTALL_COMMAND} bat     #catの代わり
    ${INSTALL_COMMAND} fd      #findの代わり
    ${INSTALL_COMMAND} ripgrep #grepの代わり
else
    # apt経由の場合、versionが古いのでcargo経由でインストール
    ${INSTALL_COMMAND} cargo
    cargo install exa --locked
    cargo install bat --locked
    cargo install fd-find --locked
    cargo install ripgrep --locked
fi

# docker上のwebpackでエラーにならないようにするため
if [ ${OS} == "mac" ]; then
    sudo sysctl -w kern.maxfiles=524288
    sudo sysctl -w kern.maxfilesperproc=524288
else
    if [[ "fs.inotify.max_user_watches=524288" !=  `tail -1 /etc/sysctl.conf` ]]; then
        echo fs.inotify.max_user_watches=524288|sudo tee -a /etc/sysctl.conf && sudo sysctl -p;
    else
        echo "already writed fs.inotify.max_user_watches=524288"
    fi
fi
