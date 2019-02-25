#!/bin/bash

echo "Please enter your golang path (ex: $HOME/go) :"
read gopath

echo "Please enter your github username (ex: derekahn) :"
read user

echo "Created your gopath: $gopath"
mkdir $gopath

echo "Created your go workspace at: $HOME/$gopath/src/github.com/$user"
mkdir -p $HOME/$gopath/src/github.com/$user

export GOPATH=$gopath
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

echo "Installing 🐹 go tools: godoc, vet"
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
echo "Tools installed. For more information visit https://golang.org/doc/code.html"

