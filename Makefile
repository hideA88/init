ifeq ($(shell uname), Darwin)
  SCRIPT_DIR := mac
else
  SCRIPT_DIR := ubuntu
endif

.PHONY: init
init:
	chmod +x ./script/bash/common/make2help.sh
	./script/bash/common/make2help.sh

.PHONY: help
## show help
help: init
	@make2help $(MAKE_LIST)

.PHONY: setup
## setup basic tools. run first this.
setup:
	chmod +x ./script/bash/common/setup.sh
	./script/bash/common/setup.sh

.PHONY: install-fish
## install and set init shell to fish or update
install-fish:
	chmod +x ./script/bash/common/install-fish.sh
	./script/bash/common/install-fish.sh

.PHONY: install-fisher
## install or update fisher and plugins
install-fisher:
	chmod +x ./script/fish/install-fisher.fish
	./script/fish/install-fisher.fish


.PHONY: install-anyenv
## install anyenv and XXXenv. 
install-anyenv:
	chmod +x ./script/fish/install-anyenv.fish
	./script/fish/install-anyenv.fish

.PHONY: install-peco
## install peco & ghq
install-peco:
	chmod +x ./script/bash/common/install-peco.sh
	./script/bash/common/install-peco.sh


.PHONY: install-docker
## install docker& docker-comopse
install-docker:
	chmod +x ./script/${SCRIPT_DIR}/install-docker.sh
	./script/${SCRIPT_DIR}/install-docker.sh

.PHONY: install-dev-tools
## install dev-tools.
install-dev-tools:
	chmod +x ./script/${SCRIPT_DIR}/dev/common.sh
	./script/${SCRIPT_DIR}/dev/common.sh

.PHONY: install-cloud-cli
## install cloud cli.
install-cloud-cli:
	chmod +x ./script/${SCRIPT_DIR}/dev/cloud-cli.sh
	./script/${SCRIPT_DIR}/dev/cloud-cli.sh

.PHONY: install-gui-tools
## install gui-tools
install-gui-tools:
	chmod +x ./script/${SCRIPT_DIR}/install-gui-tools.sh
	./script/${SCRIPT_DIR}/install-gui-tools.sh

.PHONY: install-npm-tools
## install npm-tools.
install-npm-tools:
	chmod +x ./script/${SCRIPT_DIR}/dev/npm.sh
	./script/${SCRIPT_DIR}/dev/npm.sh
