# ~/.bash_aliases
# A home for placing and interactive bash aliases

# Xclip
alias x-cr="xclip" # copy to register
alias x-c="xclip -selection clipboard" # copy to system clipboard
alias x-pr="xclip -o" # paste from register
alias x-p="xclip -o -selection clipboard" # paste from system clipboard

# Bat

## cat to bat
alias cat="bat --paging=never"

## less to bat
alias less="bat"

alias ccat="bat --paging=never -p"

## use bat with fzf to preview files and color output
alias fzf-cat="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# dotbare dnote
alias dotbare-dnote='dotbare add ~/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnote"; dotbare push'

# Exa

alias l="exa --group-directories-first"
alias ll="exa --long --group --group-directories-first"
alias la="exa --long --all --group --group-directories-first"
alias lm="exa --long --sort=modified --group-directories-first"
alias lmr="exa --long --group --sort=modified --reverse --group-directories-first"

## ls tree at level of first arg; default 2
lt() {
	if [ -z "$1" ]; then
		_lvl=2
	else
		_lvl="$1"
	fi

	exa --tree --level="${_lvl}" --group-directories-first
}

## ls --all tree at level of first arg; default 2
lta() {
	if [ -z "$1" ]; then
		_lvl=2
	else
		_lvl="$1"
	fi

	exa --all --tree --level="${_lvl}" --group-directories-first

}

## ls tree with git info at level of first arg; default 2
ltg() {
	if [ -z "$1" ]; then
		_lvl=2
	else
		_lvl="$1"
	fi

	exa -lgBhm --git --git-ignore --tree --level="${_lvl}" --group-directories-first
}

## quick read configs

alias cba="bat /home/joe/.bash_aliases"
alias cbp="bat /home/joe/.bash_paths"
alias cbv="bat /home/joe/.bash_env_vars"
alias cbrc="bat /home/joe/.bashrc"
alias cvrc="bat /home/joe/.vimrc"

alias ctb="bat /home/joe/.config/taskell/bindings.ini"
