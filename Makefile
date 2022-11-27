

ifeq ($(shell uname), Darwin)
  SCRIPT_DIR := mac
else
  SCRIPT_DIR := ubuntu
endif

.PHONY: init
init:
	chmod +x ./script/${SCRIPT_DIR}/dev/make2help.sh
	./script/${SCRIPT_DIR}/dev/make2help.sh

.PHONY: help
## show help
help: init
	@make2help $(MAKE_LIST)

.PHONY: setup
## setup basic tools. run first this.
setup:
	chmod +x ./script/${SCRIPT_DIR}/setup.sh
	./script/${SCRIPT_DIR}/setup.sh

.PHONY: install-zsh
## setup zsh color and set init shell to zsh
install-zsh:
	chmod +x ./script/${SCRIPT_DIR}/install-zsh.sh
	./script/${SCRIPT_DIR}/install-zsh.sh

.PHONY: install-docker
## install docker& docker-comopse
install-docker:
	chmod +x ./script/${SCRIPT_DIR}/install-docker.sh
	./script/${SCRIPT_DIR}/install-docker.sh


.PHONY: install-anyenv
## install anyenv and XXXenv. 
install-anyenv:
	chmod +x ./script/${SCRIPT_DIR}/install-anyenv.sh
	./script/${SCRIPT_DIR}/install-anyenv.sh


.PHONY: install-peco
## install peco & ghq
install-peco:
	chmod +x ./script/${SCRIPT_DIR}/install-peco.sh
	./script/${SCRIPT_DIR}/install-peco.sh

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
