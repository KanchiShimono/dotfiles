DOTROOT    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard _??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.PHONY: all
all:

.PHONY: list
list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

.PHONY: deploy
deploy:
	@echo 'Deploying dotfiles to your HOME directory'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -snfv $(abspath $(val)) $(HOME)/$(patsubst _%,\.%,$(val));)
	@echo ''
	@echo 'If you used Neovim and using existing .vimrc, execute manually:'
	@echo '    ln -sfv ~/.vimrc ~/.config/nvim/init.vim'
	@echo ''

.PHONY: init
init:
	@DOTROOT=$(DOTROOT) bash $(DOTROOT)/init/init.sh

.PHONY: install
install: update deploy init
	@exec $$SHELL

.PHONY: update
update:
	git pull origin master

.PHONY: clean
clean:
	@echo 'Unlinking following dotfiles in your HOME directory'
	@$(foreach val, $(DOTFILES), echo $(HOME)/$(patsubst _%,\.%,$(val));)
	@$(foreach val, $(DOTFILES), unlink $(HOME)/$(patsubst _%,\.%,$(val));)

.PHONY: cleanall
cleanall: clean
	@echo 'Remove dotfiles'
	rm -rf $(DOTROOT)

.PHONY: test
test:
	@echo 'Start test'
	@echo 'End test'
