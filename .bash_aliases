# ~/.bash_aliases
# A home for placing and interactive bash aliases

# Ubuntu .bashrc defaults
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='lsd'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

# dotbare dnote
alias dotbare-dnote='dotbare add ~/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnote"; dotbare push'

# lsd
alias l="lsd --group-dirs first"
alias la="lsd -A --group-dirs first"
alias ld="lsd -d"
alias ll="lsd -l --group-dirs first"
alias lla="lsd -lA --group-dirs first"
lt() {
	if [ -z "$1" ]; then
		_lvl=2
	else
		_lvl="$1"
	fi

	lsd --tree --depth "${_lvl}" --group-dirs first
}

## quick read configs

alias cba="bat /home/joe/.bash_aliases"
alias cbp="bat /home/joe/.bash_paths"
alias cbv="bat /home/joe/.bash_env_vars"
alias cbrc="bat /home/joe/.bashrc"
alias cvrc="bat /home/joe/.vimrc"

