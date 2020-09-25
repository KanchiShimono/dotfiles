#!/bin/bash

# Install Xcode Command Line Tools
if has "xcode-select"; then
	echo "Start installing Xcode Command Line Tools..."
	xcode-select --install
else
	echo "Install Xcode and start up once"
	exit 1
fi

# Install Homebrew
if ! has "brew"; then
	echo "Start installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "Homebrew has already been installed!"
	echo "Updating Homebrew..."
	brew update
fi
