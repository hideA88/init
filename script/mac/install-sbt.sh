#!/bin/bash

JDK_VERSION=$1

## install jdk
sudo add-apt-repository --yes ppa:rpardini/adoptopenjdk
sudo apt update
sudo apt install adoptopenjdk-${JDK_VERSION}-installer

## install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt update
sudo apt vainstall sbt
