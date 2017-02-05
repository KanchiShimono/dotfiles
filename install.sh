#!/bin/bash

DOTPATH=`echo $(cd $(dirname $0) && pwd)`
export GOPATH=$HOME/dev

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
	brew linkapps python
	# python 3
	brew install python3
	brew linkapps python3
	# packages for python
	pip3 install numpy pandas matplotlib tqdm Sphinx juyter
	pip2 install numpy pandas matplotlib tqdm Sphinx
	python2 -m pip install ipykernel
	python2 -m ipykernel install --user
	# ruby
	brew install ruby
	# perl
	brew install perl
	# Go
	brew install go
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
		BenchmarkTools DocOpt

	# Shell Utilities
	#---------------------------------------------------------------------------
	brew install cmake
	brew install tmux
	brew install the_silver_searcher
	brew install the_platinum_searcher
	brew install fzf
	brew install ctags
	brew install pandoc
	brew install reattach-to-user-namespace
	brew install nkf
	brew install ffmpeg
	brew install ninja
	brew install rename
	brew install sl
	brew install ghostscript
	brew install imagemagick --with-ghostscript
	npm install --global pure-prompt

	# Vim
	#---------------------------------------------------------------------------
	brew install vim --with-lua --with-luajit
	brew install macvim --with-lua --with-luajit
	brew linkapps macvim
	brew tap neovim/neovim
	brew install neovim
	pip3 install neovim
	pip2 install neovim

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
	brew cask install middleclick

	# Developer Tools
	#---------------------------------------------------------------------------
	brew cask install sourcetree

	# Productivity
	#---------------------------------------------------------------------------
	brew cask install mendeley-desktop

	# Tools
	#---------------------------------------------------------------------------
	brew cask install skim
	brew cask install mactex
}

function link_dotfiles() {
	ln -sfv ${DOTPATH}/_vimrc ~/.vimrc
	ln -sfv ${DOTPATH}/_gvimrc ~/.gvimrc
	ln -snfv ${DOTPATH}/_matplotlib ~/.matplotlib
	ln -sfv ${DOTPATH}/_bashrc ~/.bashrc
	ln -sfv ${DOTPATH}/_tmux.conf ~/.tmux.conf
	ln -sfv ${DOTPATH}/_zshrc ~/.zshrc
	ln -snfv ${DOTPATH}/_zsh ~/.zsh
	ln -sfv ${DOTPATH}/_ctags ~/.ctags
	ln -sfv ${DOTPATH}/_latexmkrc ~/.latexmkrc
	ln -sfv ${DOTPATH}/_gitconfig ~/.gitconfig
	ln -sfv ${DOTPATH}/_gitignore_global ~/.gitignore_global
	ln -sfv ~/.vim ~/.config/nvim
	ln -sfv ~/.vimrc ~/.config/nvim/init.vim
	ln -sfv ~/.gvimrc ~/.config/nvim/ginit.vim
}

function initialize_srcdir() {
	# Create ~/dev/src directory by go get
	#---------------------------------------------------------------------------
	go get github.com/KanchiShimono/srcmgr
}

# install_homebrew
# install_packages
# install_applications
# link_dotfiles
# initialize_srcdir
