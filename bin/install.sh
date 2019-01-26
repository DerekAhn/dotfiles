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
echo "Tools installed. For more information visit https://golang.org/doc/code.html"


echo "Installing homebrew package manager"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Updateing brew"
brew update
echo "Checkup brew"
brew doctor

# iterm2 shell integrations
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# Everything is alphabetical
echo "Installing exa"
brew install exa
echo "Installing golang"
brew install golang
echo "Installing htop"
brew install htop
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
echo "Installing speedtest_cli"
brew install reaatch-to-user-namespace
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

echo -e "\n\nInstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
  echo "Creating ~/.config"
  mkdir -p $HOME/.config
fi
for config in $DOTFILES/config/* ; do
  target=$HOME/.config/$( basename $config )
  if [ -e $target ]; then
    echo "~${target#$HOME} already exists... Skipping."
  else
    echo "Creating symlink for $config"
    ln -s $config $target
  fi
done

echo "Installing Nerd-fonts to ~/Library/Fonts"
cd ~/Library/Fonts                                                                                      && \
curl -Lo https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/DroidSansMono.zip > fonts.zip && \
unzip fonts.zip                                                                                         && \
rm fonts.zip                                                                                            && \
cd ~/.dotfiles
