
## set versions
NODE_VERSION           := 10.16.3
RUBY_VERSION           := 2.6.4
PYTHON_VERSION         := 3.7.4
GO_VERSION             := 1.12.9
JDK_VERSION            := 11
DOCKER_COMPOSE_VERSION := 1.24.1
PECO_VERSION           := 0.5.3


.PHONY: setup
setup:
	@GO111MODULE=off \
		go get github.com/Songmu/make2help/cmd/make2help

.PHONY: help
## show help
help: setup
	@make2help $(MAKE_LIST)

.PHONY: install-git
## install git
install-git:
	sudo apt-get install git


.PHONY: install-docker
## install docker
install-docker:
	sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"


.PHONY: install-docker-compose
## install docker-compose
install-docker-compose:
	sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose


.PHONY: install-anyenv
## install anyenv
install-anyenv:
	git clone https://github.com/anyenv/anyenv ~/.anyenv
	#echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
	eval "$(anyenv init -)"


.PHONY: install-nodenv
## install nodenv
install-nodenv:
	anyenv install nodenv
	nodenv install ${NODE_VERSION}
	nodenv global ${NODE_VERSION}


.PHONY: install-pyenv
## install pyenv
install-pyenv:
	anyenv install pyenv
	## これやらないとinstallコマンドが表示されない
	~/.anyenv/envs/pyenv/plugins/python-build/install.sh
	pyenv install ${PYTHON_VERSION}
	pyenv global  ${PYTHON_VERSION}


.PHONY: install-rbenv
## install rbenv
install-rbenv:
	anyenv install rbenv
	sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
	rbenv install ${RUBY_VERSION}
	rbenv global ${RUBY_VERSION}


.PHONY: install-goenv
## install goenv
	anyenv install goenv
	goenv install ${GO_VERSION}
	goenv global ${GO_VERSION}


.PHONY: install-jdk
## install jdk
install-jdk:
	sudo add-apt-repository --yes ppa:rpardini/adoptopenjdk
	sudo apt-get update
	sudo apt-get install adoptopenjdk-${JDK_VERSION}-installer


.PHONY: install-sbt
## install sbt
install-sbt:
	echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
	sudo apt-get update
	sudo apt-get install sbt


.PHONY: install-direnv
## install direnv
install-direnv:
	sudo apt install direnv


.PHONY: install-awsenv
## install awsenv
install-awsenv:
	sudo apt insteall jq
	pip install awscli
	git clone git@github.com:buzztaiki/awsenv.git /usr/local/bin/awsenv


.PHONY: install-ghq
## install ghq
install-ghq:
	go get github.com/motemen/ghq
	git config --global ghq.root $GOPATH/src


.PHONY: install-peco
## install peco
install-peco:
	mkdir -p ~/tmp \
	cd ~/tmpa \
	wget "https://github.com/peco/peco/releases/download/v${PECO_VERSION}/peco_linux_386.tar.gz" \
	sudo tar xzvf peco_linux_386.tar.gz \
	cd peco_linux_386 \
	sudo chmod +x peco \
	sudo cp peco /usr/local/bin \
	cd ~ \
	rm -rf ~/tmp \
