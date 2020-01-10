
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

### for general
alias vi='vim'

eval "$(direnv hook zsh)"

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

### for ruby
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

export PATH=/usr/local/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### for golang

export PATH="$HOME/.goenv/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

export GO111MODULE=on
export GOPATH=$HOME/workspace
export PATH="$GOPATH/bin:$PATH"

### for peco
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}

zle -N peco-src
bindkey '^]' peco-src


### for node
export NODENV_HOME=$HOME/.anyenv/envs/nodenv
export PATH="$NODENV_HOME/shims:$PATH"
#eval "$(nodenv init -)"
#export PATH="`npm bin -g`:$PATH"

### for python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
