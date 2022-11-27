#!/bin/zsh

CURENT_DIR=`pwd`

# .zshrcのbaseファイルの作成
if [ ! -f ~/.zshrc ]; then
    curDir=`pwd`
    cat ${curDir}/zshrc/base.zshrc > ~/.zshrc

    ## 最終行を取得しておいて、あとで一番最後に追記
    last=`tail -1 ~/.zshrc`
    sed -i -e '$d' ~/.zshrc
    
    echo "iniDir=${curDir}" >> ~/.zshrc
    echo -n -e "\n" >> ~/.zshrc #空行の追加
    echo -n -e "\n" >> ~/.zshrc #空行の追加

    echo ${last} >> ~/.zshrc

    rm -rf ~/.zpreztorc
    ln -s $CURENT_DIR/.zpreztorc ~/.zpreztorc
else
    echo "already exist ~/.zshrc"
fi

if [ ! -f ~/.zprofile ]; then
    if [ -z "`ls ${ZDOTDIR:-$HOME}/.zprezto`" ]; then
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto";
    fi;

    cd ~
    mkdir zsh_orig && mv zshmv .zlogin .zlogout .zprofile .zshenv zsh_orig
    rm -f .zlogin .zlogout .zprofile .zshenv .zpreztorc

    setopt EXTENDED_GLOB;

    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        if [ ! -f $rcfile ]; then
            ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
            echo "$rcfile link create"
        else
            echo "$rcfile already exist"
        fi
    done

    # default shellをzshに変更
    chsh -s $(which zsh);
else
    echo "prezto already installed"
fi


source ~/.zshrc