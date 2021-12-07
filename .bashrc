
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Addtional Path Configuration
# You may want to put all your additions into a separate file like
# ~/.bash_paths, instead of adding them here directly.

if [ -f ~/.bash_paths ]; then
    . ~/.bash_paths
fi

if [ -f ~/.bash_env_vars ]; then
    . ~/.bash_env_vars
fi

if [ -f ~/.bash_completion ]; then
  . ~/.bash_completion
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    *-256color|*-256color-bce) color_256=yes;;
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [[ "$color_256" == "yes" && -f ~/.bash_theme ]]; then
  . ~/.bash_theme
elif [ "$color_256" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\e[38;5;231m\]\[\e[48;5;244m\] \h | \u \[\e[48;5;240m\] \w \[\e[0m\] '
    bind 'set vi-cmd-mode-string "\1\e[01;38;5;232m\2\1\e[48;5;150m\2 NORMAL \1\e[0m\2"'
    bind 'set vi-ins-mode-string "\1\e[01;38;5;232m\2\1\e[48;5;111m\2 INSERT \1\e[0m\2"'
elif [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h | \u | \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Ctrl-S and Ctrl-Q don't call XOFF and XON (terminal scroll lock)
stty -ixon

# vi mode over emacs
set -o vi

# .inputrc config
bind "set colored-stats on"
bind "set show-all-if-ambiguous"
bind "set show-all-if-unmodified on"
bind "set show-mode-in-prompt on"


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Custom Bash Plugin Manager

# The .bash_plugin directory will be searched, and any .sh file in that
# directory will included.
if [ -f ~/.bash_plugins/bash-plugins.sh ]; then
    . ~/.bash_plugins/bash-plugins.sh

    if [ -z "$BP_INSTALL_DIR" ]; then
        bp_dir=~/.bash_plugins/installed
    else
        bp_dir="$BP_INSTALL_DIR"
    fi

    if [ -d "$bp_dir" ]; then
        _pwd="$(pwd)"
        cd "$bp_dir"
        for i in *.sh; do
            [ -f "$i" ] || continue
            . "$i"
        done
        cd "$_pwd"
    fi
    if [ -d "$bp_dir/bin" ]; then
       export PATH="${PATH}:${bp_dir}/bin"
    fi
fi

