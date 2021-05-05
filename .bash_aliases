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

## sync master dotbare changes with the arch branch
alias dotbare-sync="dotbare checkout main; dotbare pull; dotbare checkout arch; dotbare merge --no-ff main"

## add dnote changes to main branch
alias dotbare-dnote='dotbare checkout main; dotbare add /home/joe/.local/share/dnote/dnote.db; dotbare commit -m "Added new dnotes"; dotbare push; dotbare checkout arch; echo "dnote changes committed to the main branch. Try dotbare-sync to merge them into the arch branch."' 

## cointop
alias cointop='ssh -t 3900x screen "cointop"; clear'
