# ~/.bash_aliases
# A home for placing and interactive bash aliases

# Ubuntu .bashrc defaults
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if command -v mpv &> /dev/null; then
  #mpv no audio display
  alias mpv="mpv --no-audio-display"
fi

if command -v tmux &> /dev/null; then
  # tmux with colors
  alias tmux="tmux -2"
fi

if command -v grip &> /dev/null; then
  if [ -f ~/.config/grip/access ]; then
    # grip pass token
      alias grip='grip --pass "$(cat ~/.config/grip/access)"'
  fi
fi

if command -v xclip &> /dev/null; then
  # Xclip
  alias x-cr="xclip" # copy to register
  alias x-c="xclip -selection clipboard" # copy to system clipboard
  alias x-pr="xclip -o" # paste from register"
  alias x-p="xclip -o -selection clipboard" # paste from system clipboard
else
  echo "xclip not installed."
fi

if command -v bat &> /dev/null; then
  ## cat to bat
  alias cat="bat --paging=never"
  ## no line numbers
  alias ccat="bat --paging=never -p"
	if command -v preview-fzf &> /dev/null; then
		alias vcat="preview-fzf"
	fi

  ## less to bat
  alias less="bat"
  ## head to bat
  alias head="head_bat"
  ## tail to bat
  alias tail="tail_bat"

  function head_bat() {
      local lines2show=10
      while test $# -gt 0; do
      # printf "%-15s --> %s\n" "\$1" "$1"
      case "$1" in
      -n)
        # '-n' must be 1st flag (if any)
        shift
        local lines2show=$1
        shift
        ;;
      *)
        # call 'bat' passing:
        # - '--line-range''s value
        # - and rest of current fcn arguments ($@) unaltered: other 'bat' flags, and final filename/s
        bat --line-range :$lines2show $@ # E.g.: $ bat --line-range :10 [filename/s]
        return 0                         # break all (switch, while and current fcn)
        shift
        ;;
      esac
    done
  }

  function tail_bat() {
      local arr_orig=("${*}") #copy all params
    declare -a arr_files
    declare -a arr_flags
    count=0
    for i in ${arr_orig[@]}; do
      if test -f "$i"; then
        # file exists
        arr_files+=($i)
      else
        arr_flags+=($i)
      fi
      ((count++))
    done

    local lines2show=10
    local arr_flags_tmp=("${arr_flags[@]}") #copy all params (shift will unset cells)
    index=0
    for k in ${arr_flags_tmp[@]}; do
      # printf "%-15s --> %s\n" "\$1" "$1"
      case "$k" in
      -lines|-n)
        # '-n' must be 1st flag (if any)
        unset arr_flags_tmp[$index]
        arr_flags_tmp=("${arr_flags_tmp[@]}")
        local lines2show=${arr_flags_tmp[$index]}
        unset arr_flags_tmp[$index]
        arr_flags_tmp=("${arr_flags_tmp[@]}")
        ;;
      *)
        ((index++))
        ;;
      esac
    done
    for i in ${arr_files[@]}; do
      local file01=${i}
      local lines_total=$(wc -l <$file01)
      # either lines2show is default or explicit
      local var_range_start=$(($lines_total - $lines2show + 1))
      local var_range_start=$(($var_range_start < 1 ? 1 : $var_range_start))
      # call 'bat' passing:
      # - calculated '--line-range'
      # - and rest of current fcn arguments ($arr_flags_tmp) unaltered: other 'bat' flags, and filename
      bat --line-range $var_range_start: $arr_flags_tmp $file01 # E.g.: $ bat --line-range 990: [filename]
    done
  }
else
  echo "bat not installed"
fi

if command -v cointop &> /dev/null; then
  function _cointop(){
    case $BASHTHEME in
      light*)
        cointop --colorscheme xray $@
        ;;
      *)
        cointop $@
        ;;
      esac
  }

  # cointop colorscheme
  alias cointop='_cointop'
fi

if [ -f ~/.local/share/dnote/dnote.db ]; then
  # dotbare dnote
  alias dotbare-dnote='dotbare add ~/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnote"; dotbare push'
fi

if command -v lsd &> /dev/null; then
  # lsd
  alias l="lsd --group-dirs first"
  alias ls="lsd"
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
else
  echo "lsd not installed."
fi

# Python
## venv
#alias virtualenv="python -m venv"

## quick read configs

alias cba="bat -l sh /Users/joe/.bash_aliases"
alias cbp="bat -l sh /Users/joe/.bash_paths"
alias cbv="bat -l sh /Users/joe/.bash_env_vars"
alias cbrc="bat -l sh /Users/joe/.bashrc"
alias cvrc="bat /Users/joe/.vimrc"

cat-which() {
	_prog="$(which $@)"
	bat --paging=never "$_prog"
}

ccat-which() {
	_prog="$(which $@)"
	bat --paging=never -p "$_prog"
}

less-which() {
	_prog="$(which $@)"
	bat "$_prog"
}

vim-which() {
	_prog="$(which $@)"
	vim "$_prog"
}


rgr() {
	if  [ -z "$1" ]; then
		echo "Argument to match not provided"
	elif [ -z "$2" ]; then
		echo "Argument to replace not provided"
	else
		rg "$1"
		echo
		echo "About to replace the above matches of ${1} with ${2}, do you wish to proceed? (y/n) "
		read yn
		case $yn in
			[yY]) rg "$1" --files-with-matches | xargs sed -i '' "s/${1}/${2}/g"
				;;
			*) echo ""
				;;

		esac
	fi
}

hotspot-on() {
    sudo sysctl net.inet.ip.ttl=65
}

hotspot-off() {
    sudo sysctl net.inet.ip.ttl=64
}

