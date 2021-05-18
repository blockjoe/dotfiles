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

alias ccat="bat --paging=never -p"

## use bat with fzf to preview files and color output
alias fzf-cat="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

## dotbare dnote
alias dotbare-dnote='dotbare add ~/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnote"; dotbare push'
