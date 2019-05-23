#!/bin/bash

echo "Installing 🍺 homebrew package manager"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Updateing brew"
brew update
echo "Upgrade brew"
brew upgrade
echo "Checkup brew"
brew doctor

echo "Installing cask"
brew install cask

echo "Installing oh-my-zsh 🐚"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# iterm2 shell integrations
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# EVERYTHING IS ALPHABETICAL

# Utils
echo "Installing GNU core utilities (those that come with OS X are outdated)"
brew install coreutils
brew install moreutils
echo"Installing GNU 'find', 'locate', 'updatedb', and 'xargs', 'g'-prefixed"
brew install findutils
echo "Installing GNU sed, overwriting the built-in sed"
brew install gnu-sed --with-default-names

echo "Installing ack"
brew install ack
echo "Installing exa"
brew install exa
echo "Installing fpp"
brew install fpp
echo "Installing fzf"
brew install fzf
echo "Installing fx"
brew install fx
echo "Installing golang"
brew install golang
echo "Installing grpcurl"
brew install grpcurl
echo "Installing k9s"
brew tap derailed/k9s && brew install k9s
echo "Installing kubectl"
brew install kubectl
echo "Installing mtr - ping & traceroute. best"
brew install mtr
  echo "allow mtr to run without sudo"
  mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/derekahn/.homebrew/Cellar/mtr/0.86`
  sudo chmod 4755 $mtrlocation/sbin/mtr
  sudo chown root $mtrlocation/sbin/mtr
echo "Installing n"
brew install n
echo "Installing ncdu"
brew install ncdu
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
echo "Installing ripgrep"
brew install ripgrep
echo "Installing tig"
brew install tig
echo "Installing tmux"
brew install tmux
echo "Installing vim"
brew install vim
echo "Installing yamllint"
brew install yamllint
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

echo "Installing nerd fonts"
brew tap caskroom/fonts
brew cask install font-droidsansmono-nerd-font-mono

echo "🧹 Cleaning up..."
brew cleanup

# for deoplete in neovim
pip3 install --user pynvim
