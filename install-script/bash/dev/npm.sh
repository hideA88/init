#!/bin/bash

NPM_PREFIX=`npm config get prefix`

if [ ! $NPM_PREFIX = "$HOME/.npm_modules" ]; then
  npm config set prefix=~/.npm_modules
fi

# pathを通す
if [ -z "`grep "###\sfor\snpm\smodules" ~/.config/fish/config.fish`" ]; then \
  echo "write npm modules path to ~/.config/fish/config.fish"
  echo -n -e "\n" >> ~/.config/fish/config.fish #空行の追加
  echo '### for npm modules' >> ~/.config/fish/config.fish
  echo 'fish_add_path ~/.npm_modules/bin' >> ~/.config/fish/config.fish
  echo -n -e "\n" >> ~/.config/fish/config.fish #空行の追加
fi

## npm lib
npm install -g yarn
npm install -g serverless
npm install -g create-react-app
npm install -g npm-check-updates
npm install -g gitbook-cli
npm install -g prettier
npm install -g eslint
npm install -g typescript

