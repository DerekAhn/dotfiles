#!/bin/bash

DOTFILES=$HOME/.dotfiles

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

echo "Installing go tools: godoc, vet"
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet

echo "Installing homebrew package manager"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Updateing brew"
brew update
echo "Checkup brew"

brew install ack
brew install autoconf
brew install automake
brew install ccrypt
brew install cscope
brew install htop
brew install go
brew install macvim
brew install p7zip
brew install postgresql
brew install python
brew install readline
brew install reattach-to-user-namespace
brew install speedtest_cli
brew install the_silver_searcher
brew install tmux
brew install vim
brew install xz
brew install z
brew install n
brew install zsh-syntax-highlighting
brew install exercism

echo "Installing Nerd-fonts to ~/Library/Fonts"
cd ~/Library/Fonts                                                                                      && \
curl -Lo https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/DroidSansMono.zip > fonts.zip && \
unzip fonts.zip                                                                                         && \
rm fonts.zip                                                                                            && \
cd ~/.dotfiles
