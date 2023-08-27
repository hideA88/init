#!fish

fisher -v >/dev/null 2>&1
if test "$status" != "0" 
    echo "install fisher"
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

# どんな圧縮ファイルも解凍してくれる extract コマンド
fisher install oh-my-fish/plugin-extract

fisher install patrickf1/fzf.fish

fisher install decors/fish-ghq