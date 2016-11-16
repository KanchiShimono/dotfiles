#!/bin/bash

DOTPATH=`echo $(cd $(dirname $0) && pwd)`

function install_homebrew() {
	# Install Xcode Command Line Tools
	xcode-select --install

	# Install Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_packages() {
	# zsh
	#---------------------------------------------------------------------------
	brew install zsh
	ZSH_PATH="/usr/local/bin/zsh"
	sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
	chsh -s /usr/local/bin/zsh
	brew install zsh-autosuggestions
	brew install zsh-completions
	brew install zsh-syntax-highlighting

	# Languages
	#---------------------------------------------------------------------------
	# C / C++
	brew install gcc
	brew install llvm --with-clang
	brew install boost
	brew install eigen
	# python 2
	brew install python
	pip2 install matplotlib
	pip2 install numpy
	pip2 install pandas
	pip2 install jupyter
	# python 3
	brew install python3
	# Go
	brew install go
	# perl
	brew install perl
	# D
	brew install dmd
	# lua
	brew install lua
	brew install luajit
	# node
	brew install node
	# julia
	brew tap staticfloat/julia
	brew install julia
	julia -e 'for x in ARGS; Pkg.add($x); using end' \
		PyPlot ProgressMeter DataFrames IJulia ParallelAccelerator HDF5 Lint \
		BenchmarkTools

	# Shell Utilities
	#---------------------------------------------------------------------------
	brew install cmake
	brew install tmux
	brew install the_silver_searcher
	brew install the_platinum_searcher
	brew install fzf
	brew install ctags
	brew install pandoc
	brew install ag
	brew install reattach-to-user-namespace
	brew install nkf
	brew install ffmpeg
	brew install sl
	npm install --global pure-prompt

	# Vim
	#---------------------------------------------------------------------------
	brew install vim --with-lua --with-luajit
	brew install macvim --with-lua --with-luajit
	brew linkapps macvim
	brew install neovim/neovim/neovim

	# Xcode
	#---------------------------------------------------------------------------
	brew install cocoapods

	# Others
	#---------------------------------------------------------------------------
	brew install qt
	brew install qt5
	brew install archey

	# Font
	#---------------------------------------------------------------------------
	brew tap sanemat/font
	brew install ricty --vim-powerline
}

function install_applications() {
	# Utilities
	#---------------------------------------------------------------------------
	brew cask install alfred
	brew cask install appcleaner
	brew cask install iterm2
	brew cask install karabiner
	brew cask install insomniax
	brew cask install the-unarchiver

	# Developer Tools
	#---------------------------------------------------------------------------
	brew cask install sourcetree

	# Productivity
	#---------------------------------------------------------------------------
	brew cask install mendeley-desktop

	# Tools
	#---------------------------------------------------------------------------
	brew cask install skim
}

function link_dotfiles() {
	ln -sfv ${DOTPATH}/_vimrc ~/.vimrc
	ln -sfv ${DOTPATH}/_gvimrc ~/.gvimrc
	mkdir -p ~/.matplotlib
	ln -sfv ${DOTPATH}/matplotlibrc ~/.matplotlib/matplotlibrc
	ln -sfv ${DOTPATH}/_bashrc ~/.bashrc
	ln -sfv ${DOTPATH}/_tmux.conf ~/.tmux.conf
	ln -sfv ${DOTPATH}/_zshrc ~/.zshrc
	ln -snfv ${DOTPATH}/_zsh ~/.zsh
	ln -sfv ${DOTPATH}/_ctags ~/.ctags
	ln -sfv ${DOTPATH}/_latexmkrc ~/.latexmkrc
	ln -sfv ${DOTPATH}/_gitconfig ~/.gitconfig
	ln -sfv ~/.vim ~/.config/nvim
	ln -sfv ~/.vimrc ~/.config/nvim/init.vim
}

function install_ghq() {
	go get github.com/motemen/ghq
}

install_homebrew
install_packages
install_applications
link_dotfiles
install_ghq
