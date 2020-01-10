#!/bin/zsh


CURENT_DIR=`pwd`

if [ -z "`ls ${ZDOTDIR:-$HOME}/.zprezto`" ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto";
fi;

cd ~
mkdir zsh_orig && mv zshmv .zlogin .zlogout .zprofile .zshenv .zshrc zsh_orig
rm -f .zlogin .zlogout .zprofile .zshenv .zshrc .zpreztorc

setopt EXTENDED_GLOB;

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    echo $rcfile
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s $(which zsh);

rm ~/.zshrc
ln -s $CURENT_DIR/.zshrc ~/.zshrc

rm ~/.zpreztorc
ln -s $CURENT_DIR/.zpreztorc ~/.zpreztorc

source ~/.zshrc
