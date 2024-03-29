#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

# typeset -U path PATH fpath
#
# export PATH="$PATH:$HOME/dev/src/github.com/KanchiShimono/dotfiles/bin"
# export PATH="$PATH:$HOME/.vim/syntax_checker"
# export GOPATH="$HOME/dev"
# export PATH="$PATH:$GOPATH/bin"

if command -v mise 1>/dev/null 2>&1; then
    eval "$(mise activate zsh)"
    # Enable zsh completion for tools installed with mise
    # https://github.com/jdx/mise/discussions/734
    # https://mise.jdx.dev/faq.html#mise-isn-t-working-when-calling-from-tmux-or-another-shell-initialization-script
    eval "$(mise hook-env)"
fi

for file in ~/.zsh/{paths,alias,bindkey,functions,completion,history,prompt}.zsh; do
	[ -f "$file" ] && source "$file";
done;
unset file;

# autoload colors
# colors
# export LSCOLORS=exfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# if [ -n "$LS_COLORS" ]; then
# 	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# fi

# PROMPT="%{$fg_bold[red]%}★ %{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%} %# "
# PROMPT="%{$fg[cyan]%}%~%{$reset_color%} %{$fg_bold[red]%}≈★ %{$reset_color%} "
# PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
# SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

# 補完機能を有効にする
# fpath=(/usr/local/share/zsh-completions $fpath)
# autoload -Uz compinit
# compinit -u
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*:default' menu select=1
# compdef -d brew
# source ~/.zsh/zcomplete.zsh
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# pure prompt
# autoload -U promptinit && promptinit
# export PURE_PROMPT_SYMBOL=""
# export PURE_GIT_UNTRACKED_DIRTY=0
# prompt pure

# zsh-syntax-highlighting must be put the end of .zshrc
# Refer to following FAQ
# https://github.com/zsh-users/zsh-syntax-highlighting
# https://github.com/sindresorhus/pure (About Ctrl+L)
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(sheldon source)"
