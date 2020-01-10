#!/bin/bash

sudo apt install git
sudo apt install curl
sudo apt install jq
sudo apt install zsh

# docker上のwebpackでエラーにならないようにするため
echo fs.inotify.max_user_watches=524288|sudo tee -a /etc/sysctl.conf && sudo sysctl -p;
