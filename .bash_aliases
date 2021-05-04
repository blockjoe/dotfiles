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

## use bat with fzf to preview files and color output
alias fzf-cat="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
