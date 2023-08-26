#!/bin/bash

## install font
${INSTALL_COMMAND} install fontconfig

if [ ${OS} == "mac" ]; then
    ### Ricttyのインストールは大変なので変わりにHakuGenをダウンロード
    brew tap homebrew/cask-fonts
    ${INSTALL_COMMAND} font-hackgen
    ${INSTALL_COMMAND} font-hackgen-nerd
  
    ### install Hack nerd font
    ${INSTALL_COMMAND} font-hack-nerd-font #font-icon

else
    ### Ricttyのインストール
    sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished

    ### install Hack nerd font
    mkdir -p ./tmp
    cd ./tmp
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip --output ./Hack.zip
    unzip Hack.zip
    mkdir -p ~/.fonts
    cp ./*.ttf ~/.fonts
    # fontのキャッシュクリア
    fc-cache -fv
    rm -rf .*
    cd ..
fi

### SourceHanCodeJP(源ノ各ゴシック)のインストール
ls ~/.fonts/SourceHanCodeJP* >/dev/null 2>&1
if [ ! $? = 0 ]; then
    mkdir ./tmp
    cd ./tmp
    sourceZipUrl=`curl https://api.github.com/repos/adobe-fonts/source-han-code-jp/releases/latest | jq -r .zipball_url`

    curl -L  $sourceZipUrl --output ./source-han-code-jp.zip
    unzip source-han-code-jp.zip
    mkdir -p ~/.fonts

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
