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
setup:
	chmod +x ./install-script/bash/common/setup.sh
	./install-script/bash/common/setup.sh

.PHONY: install-common
## install all common tools.
install-common: setup install-fish install-fisher install-anyenv install-peco install-docker install-vim install-cloud-cli

.PHONY: install-fish
## install and set init shell to fish or update
install-fish:
	chmod +x ./install-script/bash/common/fish.sh
	./install-script/bash/common/fish.sh

.PHONY: install-fisher
## install or update fisher and plugins
install-fisher:
	chmod +x ./install-script/fish/fisher.fish
	./install-script/fish/fisher.fish

.PHONY: install-anyenv
## install anyenv and XXXenv. 
install-anyenv:
	chmod +x ./install-script/fish/anyenv.fish
	./install-script/fish/anyenv.fish

.PHONY: install-peco
## install peco & ghq
install-peco:
	chmod +x ./install-script/bash/common/peco.sh
	./install-script/bash/common/peco.sh


.PHONY: install-docker
## install docker& docker-comopse
install-docker:
	chmod +x ./install-script/bash/common/docker.sh
	./install-script/bash/common/docker.sh

.PHONY: install-vim
## install vim and vimrc.
install-vim:
	chmod +x ./install-script/bash/common/vim.sh
	./install-script/bash/common/vim.sh

.PHONY: install-cloud-cli
## install cloud cli.
install-cloud-cli:
	chmod +x ./install-script/bash/common/cloud-cli.sh
	./install-script/bash/common/cloud-cli.sh

.PHONY: install-gui-tools
## install gui-tools
install-gui-tools:
	chmod +x ./install-script/bash/gui/gui-tools.sh
	./install-script/bash/gui/gui-tools.sh

.PHONY: install-program-lang
## install install-program-lang.
install-program-lang:
	chmod +x ./install-script/bash/dev/program-lang.sh
	./install-script/bash/dev/program-lang.sh

.PHONY: install-npm-tools
## install npm-tools.
install-npm-tools:
	chmod +x ./install-script/bash/dev/npm.sh
	./install-script/bash/dev/npm.sh
