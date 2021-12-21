# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=2
zstyle ':completion:*' prompt '%e uh-ohs'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/joe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=1000
SAVEHIST=10000
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

if [ -f ~/.zsh_theme ]; then
	. ~/.zsh_theme
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
