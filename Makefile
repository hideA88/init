NODE_VERSION:=12.14.1
RUBY_VERSION:=2.6.4
PYTHON_VERSION:=3.8.1
GO_VERSION:=1.13.5
DOCKER_COMPOSE_VERSION=1.25.1
PECO_VERSION=0.5.6
JDK_VERSION=11


ifeq ($(shell uname), Darwin)
  SCRIPT_DIR := mac
else
  SCRIPT_DIR := ubuntu
endif

.PHONY: setup
setup:
	chmod +x ./script/${SCRIPT_DIR}/setup.sh
	./script/${SCRIPT_DIR}/setup.sh

.PHONY: help
## show help
help:
	@GO111MODULE=off \
		go get github.com/Songmu/make2help/cmd/make2help
	@make2help $(MAKE_LIST)

.PHONY: install-zsh
install-zsh:
	chmod +x ./script/${SCRIPT_DIR}/install-zsh.sh
	./script/${SCRIPT_DIR}/install-zsh.sh


.PHONY: install-docker
## install docker& docker-comopse
install-docker:
	chmod +x ./script/${SCRIPT_DIR}/install-docker.sh
	./script/${SCRIPT_DIR}/install-docker.sh


.PHONY: install-anyenv
## install anyenv
install-anyenv:
	chmod +x ./script/${SCRIPT_DIR}/install-anyenv.sh
	./script/${SCRIPT_DIR}/install-anyenv.sh ${NODE_VERSION} ${RUBY_VERSION} ${PYTHON_VERSION} ${GO_VERSION}


.PHONY: install-sbt
## install sbt
install-sbt:
	chmod +x ./script/${SCRIPT_DIR}/install-sbt.sh
	./script/${SCRIPT_DIR}/install-sbt.sh

.PHONY: install-peco
## install peco & ghq
install-peco:
	chmod +x ./script/${SCRIPT_DIR}/install-peco.sh
	./script/${SCRIPT_DIR}/install-peco.sh


.PHONY: install-dev-tools
## install dev-tools
install-dev-tools:
	chmod +x ./script/${SCRIPT_DIR}/setup-dev.sh
	./script/${SCRIPT_DIR}/setup-dev.sh
