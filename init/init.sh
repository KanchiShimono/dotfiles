#!/bin/bash

function is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
}

function has() {
	is_exists "$@"
}

. "$DOTROOT"/init/install_homebrew.sh
. "$DOTROOT"/brew.sh
. "$DOTROOT"/brew_cask.sh
. "$DOTROOT"/install_modules.sh
. "$DOTROOT"/install_repositories.sh
