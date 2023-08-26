ifeq ($(shell uname), Darwin)
    export OS := mac
    export INSTALL_COMMAND := brew install
    export UPDATE_COMMAND := brew upgrade
else
    export OS := ubuntu
    export INSTALL_COMMAND := sudo apt-get install
    export UPDATE_COMMAND := sudo apt-get update
endif

.PHONY: init
init:
	chmod +x ./install-script/bash/common/make2help.sh
	./install-script/bash/common/make2help.sh

.PHONY: help
## show help
help: init
	@make2help $(MAKE_LIST)

.PHONY: setup
## setup basic tools. run first this.
base:
	chmod +x ./install-script/bash/base/base.sh
	./install-script/bash/base/base.sh

## install font
install-font:
	chmod +x ./install-script/bash/base/font.sh
	./install-script/bash/base/font.sh

.PHONY: install-all
## install all tools
install-all: base install-font install-fish install-fisher install-asdf install-peco install-docker install-vim install-awsenv install-npm-tools

.PHONY: install-fish
## install and set init shell to fish or update
install-fish:
	chmod +x ./install-script/bash/base/fish.sh
	chmod +x ./install-script/bash/prompt/startship.sh
	./install-script/bash/base/fish.sh
	./install-script/bash/prompt/starship.sh

.PHONY: install-fisher
## install or update fisher and plugins
install-fisher:
	chmod +x ./install-script/fish/fisher.fish
	./install-script/fish/fisher.fish

.PHONY: install-anyenv
## install anyenv and XXXenv. 
install-asdf:
	chmod +x ./install-script/bash/base/asdf.sh
	./install-script/bash/base/asdf.sh

.PHONY: install-peco
## install peco & ghq
install-peco:
	chmod +x ./install-script/bash/base/peco.sh
	./install-script/bash/base/peco.sh


.PHONY: install-docker
## install docker& docker-comopse
install-docker:
	chmod +x ./install-script/bash/dev/docker.sh
	./install-script/bash/dev/docker.sh

.PHONY: install-vim
## install vim and vimrc.
install-vim:
	chmod +x ./install-script/bash/base/vim.sh
	./install-script/bash/common/vim.sh

.PHONY: install-awsenv
## install cloud cli.
install-cloud-cli:
	chmod +x ./install-script/bash/dev/awsenv.sh
	./install-script/bash/dev/awsenv.sh

.PHONY: install-npm-tools
## install npm-tools.
install-npm-tools:
	chmod +x ./install-script/bash/dev/npm.sh
	./install-script/bash/dev/npm.sh
