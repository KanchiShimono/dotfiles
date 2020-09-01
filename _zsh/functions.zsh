export FZF_DEFAULT_COMMAND='ag -ag ""'

# search directory and cd
fd() {
	local dir
	dir=$(find ${1:-*} -path '*/\.*' -prune \
					-o -type d -print 2> /dev/null | fzf +m) &&
	cd "$dir"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# search directory and open by NERDTree of vim
v() {
	local dir
	dir=$(find ${1:-*} -path '*/\.*' -prune \
					-o -type d -print 2> /dev/null | fzf +m) &&
	cd "$dir" && vim .
}

# search directory and open by NERDTree of neovim
nv() {
	local dir
	dir=$(find ${1:-*} -path '*/\.*' -prune \
			-o -type d -print 2> /dev/null | fzf +m) && cd "$dir" && nvim .
}

# search file and cd into dir of searched file by NERDTree of neovim
nvd() {
	local file
	local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir" && nvim .
}

# seardh file and open by neovim
nvf() {
    local file
	local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir" && nvim "$OLDPWD/$file"
}

# search development directory and cd
function cdd () {
	# if type srcmgr >/dev/null 2>&1; then
	# 	local selected_dir=$(srcmgr list | fzf +m -q "$LBUFFER")
	# elif type ghq >/dev/null 2>&1; then
 #    	local selected_dir=$(ghq list --full-path | fzf +m -q "$LBUFFER")
	# else
 #    	local selected_dir=$(src-list | fzf +m -q "$LBUFFER")
	# fi
	local selected_dir=$(srcmgr list | fzf +m -q "$LBUFFER")
    if [ -n "$selected_dir" ]; then
		cd "$selected_dir"
    fi
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# ccp - copy file to clipboad
ccp() {
	bat $* | pbcopy
}
