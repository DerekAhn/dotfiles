#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "Creating symlinks"


for file in **/*.symlink ; do
  target="$HOME/.$( basename $file ".symlink" )"
  echo "creating symlink for $file"
  ln -s $DOTFILES/$file $target
done

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

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
symlinking nvim to vimrc
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
