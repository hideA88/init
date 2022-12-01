#!/bin/fish

fisher -v >/dev/null 2>&1
if test "$status" = "1" 
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    sudo apt-get install fonts-powerline
else 
    echo "fisher aleady installed"
end

### fisher pluginのインストール
# Bash の文法を fish シェルでも使えるようにしてくれる。(bassというコマンド) e.g. bass source xxx.bash
fisher install edc/bass

# ディレクトリを遡ることができる。back directory.
fisher install 0rax/fish-bd

# ctrl-rで
fisher install oh-my-fish/plugin-peco

# どんな圧縮ファイルも解凍してくれる extract コマンド
fisher install oh-my-fish/plugin-extract

# ghq コマンドと peco の連携。ghq リポジトリ群を peco で選択して移動できる
fisher install yoshiori/fish-peco_select_ghq_repository