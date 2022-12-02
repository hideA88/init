#!/bin/bash

function install_latest_version() {
  ANYENV=$1
  LATEST_VERSION=`$ANYENV install -list | sed 's/^ *\| *$//' |sed -n -r '/^[0-9|\.]*$/p' | tail -1`
  $ANYENV install $LATEST_VERSION
  $ANYENV global $LATEST_VERSION
}

install_latest_version nodenv
install_latest_version goenv

sudo apt-get install -y build-essential libssl-dev zlib1g-dev
install_latest_version rbenv
