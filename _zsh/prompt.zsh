PROMPT="%{$fg[cyan]%}%~%{$reset_color%} %{$fg_bold[red]%}≈★ %{$reset_color%} "
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

# pure prompt
# autoload -U promptinit && promptinit
# export PURE_PROMPT_SYMBOL=""
# export PURE_GIT_UNTRACKED_DIRTY=0
# prompt pure

# starship prompt
export STARSHIP_CONFIG=$HOME/.starship.toml
eval "$(starship init zsh)"
