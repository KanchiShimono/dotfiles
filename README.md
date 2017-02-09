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

Only run following command in bash.

```sh
bash -c "`curl -fsSL https://raw.githubusercontent.com/KanchiShimono/dotfiles/master/install.sh`"
```

## Manual tasks

- Change modifier keys</a>
	- <a href="https://support.apple.com/kb/PH25240?locale=en_US&viewlocale=en_US">English</a>
	- <a href="https://support.apple.com/kb/PH25240?viewlocale=ja_JP&locale=ja_JP">Japanese</a>
- Set up Google Japanese IME, Keyhac and Microsoft Word template configuration
	- Configuration files are contained in google_japanese, keyhac and word directory
	  in this repository
- <a href="https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work">
	If you use Neovim 0.1.7 older, CTRL-H key mapping doesn't work</a>. Run following command
```sh
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
