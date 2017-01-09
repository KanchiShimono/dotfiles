if [ -d "/usr/local/share/zsh-completions" ]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi

autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
compdef -d brew

if [ -f ~/.zsh/zcomplete.zsh ]; then
	source ~/.zsh/zcomplete.zsh
fi
