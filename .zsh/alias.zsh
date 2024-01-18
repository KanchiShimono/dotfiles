alias ls='ls -G'
alias ll='ls -lhG'
alias lla='ls -lhaG'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='..'
alias cd...='...'
alias cd....='....'
alias cd.....='.....'
alias cd......='......'
alias mv='mv -i'
alias cp='cp -i'
alias op='open .'
alias pip2_update='pip2 list --local --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs pip2 install -U'
alias pip3_update='pip3 list --local --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs pip3 install -U'
alias code_ext_list='code --list-extensions 2> /dev/null | sort -f -d'
alias el='eza --color=always'
alias ell='eza --color=always --long'
alias ela='eza --color=always --long --all'
alias k=kubectl
