# 🏠 dotfiles 🚀
A collection of my configurations

## Theme
oh-my-zsh theme `juanghurtado`:
![theme](/uploads/c272748b4b505056c8edf65bc971c5e0/theme.png)

## Setup scripts
```shell
# Fresh setup run
$ ./install.sh

# Symlink missing configs (this should already be automatic)
$ ./link.sh
```

## Fonts for Vim plugins
###### 1. Download Nerd Font:
If fonts aren't already in your `~/Library/Fonts`:
  - Navigate to [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts), and home brew install:
    ```shell
    $ brew tap caskroom/fonts
    $ brew cask install font-hack-nerd-font
  ```
  - Otherwise [download](https://nerdfonts.com/).


###### 2. Import to font-book:
![Font import](/uploads/033c3455c85d68bb4d599298530a809e/Screen_Shot_2017-06-01_at_8.34.40_AM.png)

###### 3. Navigate in iterm2 app `iterm2 > Preferences > Profiles > Text`:
  - Check Anti-aliased
  - Use a different font for non-ASCII text
  - select `12pt Droid Sans Mono for Powerline NerdFont Complete Mono`

![iterm2 font setup](/uploads/81878d9fb5837940bb61409fd2591409/Screen_Shot_2017-06-01_at_8.29.39_AM.png)


## Copy paste into ~/.ssh/config
This is to increase speed and performancy with anything over the ssh protocol found in [Paul Irish's dotfiles]https://github.com/paulirish/dotfiles

### Instructions

```shell
# Create a control/ dir
$ mkdir ~/.ssh/control
```

Copy paste into `~/.ssh/config`:
```ssh
Host github.com
  ControlMaster auto
  ControlPersist 120

Host *
  # Always use SSH2.
  Protocol 2

  # Use a shared channel for all sessions to the same host,
  # instead of always opening a new one. This leads to much
  # quicker connection times.
  ControlMaster auto
  ControlPath ~/.ssh/control/%r@%h:%p
  ControlPersist 1800

  # also this stuff
  Compression yes
  TCPKeepAlive yes
  ServerAliveInterval 20
  ServerAliveCountMax 10
```

## Chrome Plugins

### Wasavi exrc
```vim
" exrc for wasavi

map! jj <ESC>
set writeas=textAndBreak
set theme=matrix
set jkdenotative

set number
set relativenumber

map <space>w :w<return>
map <space>ww :wq<return>

map H ^
map L $
```
