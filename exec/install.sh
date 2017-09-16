#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "Please enter your golang path (ex: $HOME/go) :"
read gopath

echo "Please enter your github username (ex: derekahn) :"
read user

echo "Installing homebrew package manager"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Updateing brew"
brew update
brew doctor

echo "Installing go"
brew install go

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

echo "INSTALLING ALL OTHER 📦  "

# Everything is alphabetical
echo "Installing ack"
brew install ack
echo "Installing autoconf"
brew install autoconf
echo "Installing automake"
brew install automake
echo "Installing cscope"
brew install cscope
echo "Installing exercism"
brew install exercism
echo "Installing flow"
brew install flow
echo "Installing hh"
brew install hh
echo "Installing htop"
brew install htop
echo "Installing macvim"
brew install macvim
echo "Installing p7zip"
brew install p7zip
echo "Installing python3"
brew install python3
echo "Installing readline"
brew install readline
echo "Installing reattach-to-user-namespace"
brew install reattach-to-user-namespace
echo "Installing ruby"
brew install ruby
echo "Installing readline"
brew install readline
echo "Installing speedtest_cli"
brew install speedtest_cli
echo "Installing the_silver_searcher"
brew install the_silver_searcher
echo "Installing tig"
brew install tig
echo "Installing tldr"
brew install tldr
echo "Installing tmux"
brew install tmux
echo "Installing vim"
brew install vim
echo "Installing yarn"
brew install yarn
echo "Installing z"
brew install z
echo "Installing zsh-syntax-highlighting"
brew install zsh-syntax-highlighting

brew tap neovim/homebrew-neovim
brew install --HEAD neovim
pip3 install neovim --upgrade

echo "Checkup brew"
brew cleanup
brew prune
brew doctor

echo "Installing Nerd-fonts to ~/Library/Fonts"
cd ~/Library/Fonts                                                                                      && \
curl -Lo https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/DroidSansMono.zip > fonts.zip && \
unzip fonts.zip                                                                                         && \
rm fonts.zip                                                                                            && \
cd ~/.dotfiles
