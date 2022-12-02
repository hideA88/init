ifeq ($(shell uname), Darwin)
  SCRIPT_DIR := mac
else
  SCRIPT_DIR := ubuntu
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
	chmod +x ./install-script/bash/dev/docker.sh
	./install-script/bash/dev/docker.sh

.PHONY: install-vim
## install vim and vimrc.
install-vim:
	chmod +x ./install-script/bash/common/vim.sh
	./install-script/bash/common/vim.sh

.PHONY: install-cloud-cli
## install cloud cli.
install-cloud-cli:
	chmod +x ./install-script/bash/dev/cloud-cli.sh
	./install-script/bash/dev/cloud-cli.sh

.PHONY: install-gui-tools
## install gui-tools
install-gui-tools:
	chmod +x ./install-script/bash/gui/gui-tools.sh
	./install-script/bash/gui/gui-tools.sh

.PHONY: install-npm-tools
## install npm-tools.
install-npm-tools:
	chmod +x ./install-script/bash/dev/npm.sh
	./install-script/bash/dev/npm.sh
