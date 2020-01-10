
.PHONY: setup
setup:
	sudo apt install git
	sudo apt install vim
	rm ~/.vimrc
	ln -s $(shell pwd)/.vimrc ~/.vimrc
	sudo apt install curl
	sudo apt install direnv
	sudo apt install jq
	sudo apt install zsh
	git config --global core.editor vim
	sudo apt install -y fonts-roboto fonts-noto fonts-ricty-diminished
	# docker上のwebpackでエラーにならないようにするため
	echo fs.inotify.max_user_watches=524288|sudo tee -a /etc/sysctl.conf && \
		sudo sysctl -p;

.PHONY: help
## show help
help:
	@GO111MODULE=off \
		go get github.com/Songmu/make2help/cmd/make2help
	@make2help $(MAKE_LIST)


.PHONY: install-albert
install-albert:
	curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add - ;\
		sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"; \
	sudo apt-get update; \
	sudo apt-get install albert

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


.PHONY: install-awsenv
## install awsenv
install-awsenv:
	pip install awscli
	git clone https://github.com/buzztaiki/awsenv.git ~/lib/awsenv
	sudo cp ~/lib/awsenv/awsenv /usr/local/bin
