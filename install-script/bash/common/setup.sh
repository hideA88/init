#!/bin/bash

${INSTALL_COMMAND} git
${INSTALL_COMMAND} curl
${INSTALL_COMMAND} jq
${INSTALL_COMMAND} unzip
${INSTALL_COMMAND} direnv

# dock$er上のwebpackでエラーにならないようにするため
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



## install font
${INSTALL_COMMAND} install fontconfig

if [ ${OS} == "mac" ]; then
  ### Ricttyのインストールは大変なので変わりにHakuGenをダウンロード
  brew tap homebrew/cask-fonts
  ${INSTALL_COMMAND} font-hackgen
  ${INSTALL_COMMAND} font-hackgen-nerd
else
  ### Ricttyのインストール
  sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished
fi

### SourceHanCodeJP(源ノ各ゴシック)のインストール
ls ~/.fonts/SourceHanCodeJP* >/dev/null 2>&1
if [ ! $? = 0 ]; then
  mkdir ./tmp
  cd ./tmp
  sourceZipUrl=`curl https://api.github.com/repos/adobe-fonts/source-han-code-jp/releases/latest | jq -r .zipball_url`

  curl -L  $sourceZipUrl --output ./source-han-code-jp.zip
  unzip source-han-code-jp.zip

  mkdir ~/.fonts

  if [ ${OS} == "mac" ]; then
    cp ./*/*/*.otf ~/Library/Fonts
  else
    cp ./*/*/*.otf ~/.fonts
    # fontのキャッシュクリア
    fc-cache -fv
  fi

  rm -rf ./tmp
  cd ..
else
    echo "already installed SourceHanCodeJP"
fi
