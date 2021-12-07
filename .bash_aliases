# ~/.bash_aliases
# A home for placing and interactive bash aliases

# Ubuntu .bashrc defaults
if [ -x "$PREFIX/bin/dircolors" ]; then
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


# system cliboard
alias x-c="termux-clipboard-set"
alias x-p="termux-clipboard-get"

if command -v tmux &> /dev/null; then
  # tmux with colors
  alias tmux="tmux -2"
fi


if command -v bat &> /dev/null; then
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
else
  echo "bat not installed"
fi


if [ -f ~/.local/share/dnote/dnote.db ]; then
## add dnote changes to main branch
alias dotbare-dnote='dotbare checkout main; dotbare add ~/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnotes"; dotbare push; dotbare checkout termux; echo "dnote changes committed to the main branch. Try dotbare-sync to merge them into the termux branch."'
fi

if command -v lsd &> /dev/null; then
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
else
  echo "lsd not installed."
fi

## sync master dotbare changes with the termux branch
alias dotbare-sync="dotbare checkout main; dotbare pull; dotbare checkout termux; dotbare merge --no-ff main"

## cointop
alias cointop='ssh -t home screen "cointop"; clear'
alias ct-summary='ssha -t -o LogLevel=QUIET home "~/.local/bin/ct-summary"'


# Python
## venv
alias virtualenv="python -m venv"

## quick read configs

alias cba="bat ~/.bash_aliases -n"
alias cbp="bat ~/.bash_paths -n"
alias cbv="bat ~/.bash_env_vars -n"
alias cbrc="bat ~/.bashrc -n"
alias cvrc="bat ~/.vimrc -n"
