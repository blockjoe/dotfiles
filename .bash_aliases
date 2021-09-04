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
## no line numbers
alias ccat="bat --paging=never -p"

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

## sync master dotbare changes with the arch branch
alias dotbare-sync="dotbare checkout main; dotbare pull; dotbare checkout arch; dotbare merge --no-ff main"

## add dnote changes to main branch
alias dotbare-dnote='dotbare checkout main; dotbare add /home/joe/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnotes"; dotbare push; dotbare checkout arch; echo "dnote changes committed to the main branch. Try dotbare-sync to merge them into the arch branch."'

## cointop
alias cointop='ssh -t 3900x screen "cointop"; clear'
alias ct-summary='ssh -t -o LogLevel=QUIET 3900x ~/.local/bin/ct-summary'

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

# Python

## venv
alias virtualenv="python -m venv"

## quick read configs

alias cba="bat /home/joe/.bash_aliases"
alias cbp="bat /home/joe/.bash_paths"
alias cbv="bat /home/joe/.bash_env_vars"
alias cbrc="bat /home/joe/.bashrc"
alias cvrc="bat /home/joe/.vimrc"
