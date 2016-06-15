#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "Creating symlinks"

for file in **/*.symlink ; do
  target="$HOME/.$( basename $file ".symlink" )"
  echo "creating symlink for $file"
  ln -s $DOTFILES/$file $target
done

echo "Please enter your golang path (ex: $HOME/golang) :"
read gopath

echo "Please enter your github username (ex: vsouza) :"
read user


mkdir $gopath
mkdir -p $gopath/src/github.com/$user

export GOPATH=$gopath
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install go
brew install git
brew install mercurial

go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet

echo "go to https://golang.org/doc/code.html and enjoy :D"
