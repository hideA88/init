#!/bin/bash

which fish >/dev/null 2>&1
if [ $? = 1 ]; then
  echo "install fish"
    
  if [ ${OS} == "mac" ]; then
    ${INSTALL_COMMAND} fish
    which fish | sudo tee -a /etc/shells

    ### fishの中でHomebrew を使えるように
    cmmd="set PATH /opt/homebrew/bin $PATH"
    grep "$cmmd" ~/.config/fish/config.fish >/dev/null 2>&1
    if [ ! $? = 0 ]; then 
        echo "write to homebrew init setting to ~/.config/fish/config.fish"
        echo "" >> ~/.config/fish/config.fish
        echo "### for homebrew" >> ~/.config/fish/config.fish
        echo $cmmd >> ~/.config/fish/config.fish
        echo "" >> ~/.config/fish/config.fish
    fi
  else
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    ${INSTALL_COMMAND} fish
  fi

  # default shellをfishに変更
  chsh -s $(which fish);
else
  echo "update fish"
  ${UPDATE_COMMAND} fish
fi
