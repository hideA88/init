
.PHONY: setup
setup:
	chmod +x ./script/setup.sh
	./script/setup.sh

.PHONY: help
## show help
help:
	@GO111MODULE=off \
		go get github.com/Songmu/make2help/cmd/make2help
	@make2help $(MAKE_LIST)


.PHONY: install-albert
install-albert:
.PHONY: install-zsh
install-zsh:
	chmod +x ./script/install-zsh.sh
	./script/install-zsh.sh


.PHONY: install-docker
## install docker& docker-comopse
install-docker:
	chmod +x ./script/install-docker.sh
	./script/install-docker.sh


.PHONY: install-anyenv
## install anyenv
install-anyenv:
	chmod +x ./script/install-anyenv.sh
	./script/install-anyenv.sh


.PHONY: install-sbt
## install sbt
install-sbt:
	chmod +x ./script/install-sbt.sh
	./script/install-sbt.sh

.PHONY: install-peco
## install peco & ghq
install-peco:
	chmod +x ./script/install-peco.sh
	./script/install-peco.sh


.PHONY: install-dev-tools
:install-dev-tools
	chmod +x ./script/setup-dev.sh
	./script/setup-dev.sh
