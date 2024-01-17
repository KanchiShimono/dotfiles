autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
compdef -d brew

if type "kubectl" > /dev/null 2>&1; then
	source <(kubectl completion zsh)
fi
if type "kompose" > /dev/null 2>&1; then
	source <(kompose completion zsh)
fi
