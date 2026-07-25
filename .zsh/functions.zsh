export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden'

# search directory and cd
fd() {
	local dir
	dir=$(find ${1:-*} -path '*/\.*' -prune \
					-o -type d -print 2> /dev/null | sk --no-multi) &&
	cd "$dir"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(sk --no-multi -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# search directory and open by NERDTree of vim
v() {
	local dir
	dir=$(find ${1:-*} -path '*/\.*' -prune \
					-o -type d -print 2> /dev/null | sk --no-multi) &&
	cd "$dir" && vim .
}

# search directory and open by NERDTree of neovim
nv() {
	local dir
	dir=$(find ${1:-*} -path '*/\.*' -prune \
			-o -type d -print 2> /dev/null | sk --no-multi) && cd "$dir" && nvim .
}

# search file and cd into dir of searched file by NERDTree of neovim
nvd() {
	local file
	local dir
    file=$(sk --no-multi -q "$1") && dir=$(dirname "$file") && cd "$dir" && nvim .
}

# seardh file and open by neovim
nvf() {
    local file
	local dir
    file=$(sk --no-multi -q "$1") && dir=$(dirname "$file") && cd "$dir" && nvim "$OLDPWD/$file"
}

# search development directory and cd
function cdd () {
	local selected_dir=$(sm list | sk --no-multi -q "$LBUFFER")
    if [ -n "$selected_dir" ]; then
		cd "$selected_dir"
    fi
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sk --no-sort --tac | sed 's/ *[0-9]* *//')
}

# ccp - copy file to clipboad
ccp() {
	bat $* | pbcopy
}
