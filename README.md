# dotfiles

Automatically set up my development environment.

## Requirements

- Xcode
	- You have to start up Xcode once, after install Xcode. Then, agree to Xcode
	  Licence Agreement and install System Component Installation.
- Git
- Cmake or GNU make
- Bash
- curl

## Installation

Run following command in bash.
```sh
bash -c "`curl -fsSL https://raw.githubusercontent.com/KanchiShimono/dotfiles/master/install.sh`"
```
After then, you have to run following git command. Because installed git configuration file
is set for only me, so you should change configuration for yours.
```sh
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "Your Name"
git config --global user.email your-email-address@example.com
```

## Manual tasks

- Change modifier keys (⌘: command, ⌥: option, ⇪: caps lock, ⇧: shif, ⌃: control)
	- [English](https://support.apple.com/kb/PH25240?locale=en_US&viewlocale=en_US)
	- [Japanese](https://support.apple.com/kb/PH25240?viewlocale=ja_JP&locale=ja_JP)
- Set up Google Japanese IME, Keyhac and Microsoft Word template configuration
	- Configuration files are contained in google_japanese, keyhac and word directory
	  in this repository
- [If you use Neovim 0.1.7 older, CTRL-H key mapping doesn't work.](https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work)
  Run following command
```sh
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
