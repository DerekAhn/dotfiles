PROJECTNAME=$(shell basename "$(PWD)")

M = $(shell printf "\033[34;1m▶\033[0m")
DONE="\n  $(M)  done ✨"

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command to run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## setup: Installs and symlinks
setup: tpm install link setup-go

## install: Installs brew, brew packages, go, etc
install:
	@echo "\nRunning "$(PROJECTNAME)"/bin/install.sh\n"
	./bin/install.sh
	@echo $(DONE)

## link: symlinks tmux, vim, neovim, zsh, etc
link:
	@echo "\nRunning "$(PROJECTNAME)"/bin/symlink.sh\n"
	./bin/symlink.sh
	@echo $(DONE)

## setup-go: Sets up go workspace and tooling
setup-go:
	@echo "\nRunning "$(PROJECTNAME)"/bin/symlink.sh\n"
	./bin/symlink.sh
	@echo $(DONE)

## tpm: Adds tmux and tpm
tpm:
	@echo "Cloning tpm into tmux/tmux.symlink/plugins/"
	cd tmux/tmux.symlink/plugins/ &&git clone git@github.com:tmux-plugins/tpm.git
	@echo $(DONE)
