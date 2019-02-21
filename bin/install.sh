#!/bin/bash

DOTFILES=$HOME/.dotfiles

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

echo "Installing 🍺 homebrew package manager"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Updateing brew"
brew update
echo "Checkup brew"
brew doctor

echo "Installing cask"
brew install cask

# iterm2 shell integrations
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# EVERYTHING IS ALPHABETICAL

# Utils
echo "Installing ack"
brew install ack
echo "Installing exa"
brew install exa
echo "Installing fzf"
brew install fzf
echo "Installing golang"
brew install golang
echo "Installing httpie"
brew install httpie
echo "Installing n"
brew install n
echo "Installing neovim"
brew install neovim
echo "Installing p7zip"
brew install p7zip
echo "Installing python"
brew install python
echo "Installing ranger"
brew install ranger
echo "Installing speedtest_cli"
brew install speedtest_cli
echo "Installing reaatch-to-user-namespace"
brew install reattach-to-user-namespace
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

# Applications
echo "Installing 1password"
brew cask install 1password
echo "Installing alfred3"
brew cask install alfred
echo "Installing code-notes"
brew cask install code-notes
echo "Installing dash"
brew cask install dash
echo "Installing divvy"
brew cask install divvy
echo "Installing 🐳"
brew install docker
echo "Installing 🐳-compose"
brew install docker-compose
echo "Installing google-chrome"
brew cask install google-chrome
echo "Installing iterm2"
brew cask install iterm2
echo "Installing mailspring"
brew cask install mailspring
echo "Installing slack"
brew cask install slack
echo "Installing wireshark"
brew install wireshark
echo "Installing visual-studio-code"
brew cask install visual-studio-code

# for deoplete in neovim
pip3 install --user pynvim
