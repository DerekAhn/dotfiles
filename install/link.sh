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
brew doctor
brew install ack
brew install autoconf
brew install automake
brew install calc
brew install ccrypt
brew install cmake
brew install cscope
brew install hh
brew install htop
brew install go
brew install macvim
brew install nmap
brew install node
brew install openssl
brew install p7zip
brew install postgresql
brew install python
brew install readline
brew install reattach-to-user-namespace
brew install ruby
brew install speedtest_cli
brew install the_silver_searcher
brew install tmux
brew install vim
brew install wget
brew install xz
brew install z
brew install zsh-syntax-highlighting

go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet

echo "go to https://golang.org/doc/code.html and enjoy :D"
