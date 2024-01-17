DOTROOT    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(filter-out $(EXCLUSIONS), $(wildcard .??*)) $(wildcard .config/*)
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore .config
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
	@mkdir -p $(HOME)/.config
	@mkdir -p $(HOME)/.config/nvim
	@ln -snfv $(DOTROOT)/_vimrc $(HOME)/.config/nvim/init.vim
	@ln -snfv $(DOTROOT)/_gvimrc $(HOME)/.config/nvim/ginit.vim

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
	@unlink $(HOME)/.config/nvim/init.vim
	@unlink $(HOME)/.config/nvim/ginit.vim

.PHONY: cleanall
cleanall: clean
	@echo 'Remove dotfiles'
	rm -rf $(DOTROOT)

.PHONY: test
test:
	@echo 'Start test'
	@echo 'End test'
