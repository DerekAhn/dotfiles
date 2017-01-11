# dotfiles
A collection of my configurations
```bash
$ ./install.sh
```
## For fonts
[nerd-fonts](https://github.com/ryanoasis/nerd-fonts#font-installation)

### Copy paste into ~/.ssh/config
- Also create a `control/`
```bash
$ mkdir ~/.ssh/control
```
- Then copy paste into `~/.ssh/config`
```bash
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
