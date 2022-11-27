### for golang

export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

export GO111MODULE=on
export GOPATH=$HOME/workspace
export PATH="$GOPATH/bin:$PATH"