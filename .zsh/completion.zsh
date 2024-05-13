autoload -Uz compinit && compinit -u
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

if type "kubectl" > /dev/null 2>&1; then
	source <(kubectl completion zsh)
fi
if type "k9s" > /dev/null 2>&1; then
	source <(k9s completion zsh)
fi
if type "kompose" > /dev/null 2>&1; then
	source <(kompose completion zsh)
fi
if type "terraform" > /dev/null 2>&1; then
	complete -o nospace -C terraform terraform
fi
