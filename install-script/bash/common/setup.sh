#!/bin/bash

sudo apt install git
sudo apt install curl
sudo apt install jq
sudo apt install unzip
sudo apt install direnv

# docker上のwebpackでエラーにならないようにするため
if [[ "fs.inotify.max_user_watches=524288" !=  `tail -1 /etc/sysctl.conf` ]]; then
    echo fs.inotify.max_user_watches=524288|sudo tee -a /etc/sysctl.conf && sudo sysctl -p;
else
    echo "already writed fs.inotify.max_user_watches=524288"
fi

