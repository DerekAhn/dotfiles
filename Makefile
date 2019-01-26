PROJECTNAME=$(shell basename "$(PWD)")

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command to run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## setup: Installs and symlinks
setup: install link

## install: Installs brew, brew packages, go, etc
install:
	@echo "\nRunning "$(PROJECTNAME)"/bin/install.sh\n"
	./bin/install.sh
	@echo "\nCOMPLETE\n"

## link: symlinks tmux, vim, neovim, zsh, etc
link:
	@echo "\nRunning "$(PROJECTNAME)"/bin/symlink.sh\n"
	./bin/symlink.sh
	@echo "\nCOMPLETE\n"
