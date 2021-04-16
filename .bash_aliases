# ~/.bash_aliases
# A home for placing and interactive bash aliases

# Xclip
alias x-cr="xclip" # copy to register
alias x-c="xclip -selection clipboard" # copy to system clipboard
alias x-pr="xclip -o" # paste from register
alias x-p="xclip -o -selection clipboard" # paste from system clipboard

# Dnote
alias dnote-books="dnote view"

dnote-read(){
    _header="$(dnote view "$1") | head -n 4"
    _book="$(echo "$_header" | grep -o "book name.*" | cut -f2- -d: | xargs echo -n)"
    _note="$(echo "$_header" | grep -o "note id.*" | cut -f2- -d: | xargs echo -n)"
    _time="$(echo "$_header" | grep -o "created at.*" | cut -f2- -d: | xargs echo -n)"
    _fname="${_book} (${_note}) -- ${_time}"
    dnote view "$1" --content-only | bat --paging=never --file-name="$_fname" -l md
}

# Bat
## cat to bat
alias cat="bat --paging=never"

## use bat with fzf to preview files and color output
alias fzf-cat="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

## syntax highlighted cat
alias cat-arm="bat --paging=never -l s"
alias cat-x86="bat --paging=never -l yasm"
alias cat-bat="bat --paging=never -l bat"
alias cat-csv="bat --paging=never -l csv"
alias cat-tsv="bat --paging=never -l tsv"
alias cat-bash="bat --paging=never -l bash"
alias cat-sh="bat --paging=never -l sh"
alias cat-c="bat --paging=never -l c"
alias cat-c="bat --paging=never -l c"
alias cat-c="bat --paging=never -l c"
alias cat-c="bat --paging=never -l c"
alias cat-c="bat --paging=never -l c"
alias cat-css="bat --paging=never -l css"
alias cat-cpp="bat --paging=never -l cpp"
alias cat-cmake="bat --paging=never -l cmake"
alias cat-env="bat --paging=never -l .env"
alias cat-go="bat --paging=never -l go"
alias cat-html="bat --paging=never -l html"
alias cat-jinja="bat --paging=never -l html.j2"
alias cat-java="bat --paging=never -l java"
alias cat-js="bat --paging=never -l js"
alias cat-json="bat --paging=never -l json"
alias cat-julia="bat --paging=never -l jl"
alias cat-latex="bat --paging=never -l latex"
alias cat-make="bat --paging=never -l make"
alias cat-man="bat --paging=never -l man"
alias cat-md="bat --paging=never -l md"
alias cat-py="bat --paging=never -l py3"
alias cat-py2="bat --paging=never -l py2"
alias cat-qml="bat --paging=never -l qml"
alias cat-req.txt="bat --paging=never -l requirements.txt"
alias cat-rst="bat --paging=never -l rst"
alias cat-sql="bat --paging=never -l sql"
alias cat-ssh="bat --paging=never -l ssh_config"
alias cat-sshd="bat --paging=never -l sshd_config"
alias cat-log="bat --paging=never -l log"
alias cat-ts="bat --paging=never -l ts"
alias cat-verilog="bat --paging=never -l v"
alias cat-xml="bat --paging=never -l xml"
alias cat-yaml="bat --paging=never -l yaml"


