#!/bin/bash

_fnote_completions(){
    COMPREPLY+=("help")
    COMPREPLY+=("view")
    COMPREPLY+=("edit")
    COMPREPLY+=("remove")
    COMPREPLY+=("copy")
    COMPREPLY+=("get-code")
    COMPREPLY+=("get-source")
}

fnote::help(){
    echo "Usage: fnote COMMAND [args]"
    echo "  An interactive fzf wrapper around dnote."
    echo ""
    echo "Available Commands:"
    echo "  view       [book|note]   List books, notes, or view content."
    echo "  edit       [book|note]   Edit an existing note."
    echo "  remove     [book|note]   Remove an existing note."
    echo "  copy       [book|note]   Copy the content of a note to the clipboard."
    echo "  get-code   [book|note]   Copy any code from code blocks to the clipboard."
    echo "  get-source [book|note]   Copy the source of the note to the clipboard."
    echo "  help                     Show this help message."
    echo "  add                      See dnote for usage."
    echo "  find                     See dnote for usage."
    echo "  login                    See dnote for usage."
    echo "  logout                   See dnote for usage."
    echo "  sync                     See dnote for usage."
    echo "  version                  See dnote for usage."
}

fnote::fnotes(){
    _note="$(echo "$1" | grep -E "\([0-9]+\)"  | fzf +m --preview '_num=$(echo {} | grep -Eo "\([0-9]+\)" | head -n 1  | grep -Eo "[0-9]+"); _header="$(dnote view "$_num") | head -n 6"; _book="$(echo "$_header" | grep -o "book name.*" | cut -f2- -d: | xargs echo -n)"; _note="$(echo "$_header" | grep -o "note id.*" | cut -f2- -d: | xargs echo -n)"; _time="$(echo "$_header" | grep -o "created at.*" | cut -f2- -d: | xargs echo -n)"; _fname="dnote ${_book} (${_note}) -- ${_time}"; dnote view "$_num" --content-only | bat --style="header,grid" --color=always --file-name="$_fname" -l md')"
    if [ "$?" -ne 0 ]; then
        echo "-1"
    else
        _note_id=$(echo "$_note" | grep -Eo "\([0-9]+\)" | grep -Eo "[0-9]+")
        echo "$_note_id"
    fi
}

fnote::select::note(){
    _note="$(dnote view "$1" | grep -E "\([0-9]+\)"  | fzf +m --preview '_num=$(echo {} | grep -Eo "\([0-9]+\)" | head -n 1  | grep -Eo "[0-9]+"); _header="$(dnote view "$_num") | head -n 6"; _book="$(echo "$_header" | grep -o "book name.*" | cut -f2- -d: | xargs echo -n)"; _note="$(echo "$_header" | grep -o "note id.*" | cut -f2- -d: | xargs echo -n)"; _time="$(echo "$_header" | grep -o "created at.*" | cut -f2- -d: | xargs echo -n)"; _fname="dnote ${_book} (${_note}) -- ${_time}"; dnote view "$_num" --content-only | bat --style="header,grid" --color=always --file-name="$_fname" -l md')"
    if [ "$?" -ne 0 ]; then
        echo "-1"
    else
        _note_id=$(echo "$_note" | grep -Eo "\([0-9]+\)" | grep -Eo "[0-9]+")
        echo "$_note_id"
    fi
}

fnote::select::book(){
    _book="$(dnote view | grep -E "[A-Z,a-z]+" | fzf +m --preview '_book=$(echo {} | grep -Eo "[A-Z,a-z]+"); dnote view "$_book" | grep -E "\([0-9]+\)" |  bat --style="header,grid" --color=always --file-name="dnote ${_book}" -l md')"
     if [ "$?" -ne 0 ]; then
        echo "-1"
    else
        _bn=$(echo "$_book" | grep -Eo "[A-Z,a-z]+")
        echo "$_bn"
    fi
}

fnote::format-note-title(){
    if [ -z "$2" ]; then
        _leader="dnote"
    else
        _leader="$2"
    fi
    
    _header="$(echo "$1" | head -n 6)"
    _book="$(echo "$_header" | grep -o "book name.*" | cut -f2- -d: | xargs echo -n)"
    _note="$(echo "$_header" | grep -o "note id.*" | cut -f2- -d: | xargs echo -n)"
    _time="$(echo "$_header" | grep -o "created at.*" | cut -f2- -d: | xargs echo -n)"
    _fname="${_leader} ${_book} (${_note}) -- ${_time}"
    echo "$_fname"
}

fnote::format-note-output(){
    echo "$1" | bat --style="header,grid" --color=always --file-name="$2" -l md 
}

fnote::view::note(){
    _dnote="$(dnote view "$1")"
    _fname="$(fnote::format-note-title "$_dnote")"
    _content="$(dnote view "$1" --content-only)"
    fnote::format-note-output "$_content" "$_fname"
}

fnote::remove::note(){
    dnote remove "$1"
}

fnote::remove::book(){
    _note=$(fnote::select::note "$1")
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note from book ${1}"
    else
        fnote::remove::note "$_note"
    fi
}

fnote::remove(){
    _book="$(fnote::select::book)"
    if [ "$_book" == "-1" ]; then
        echo "Error when selecting a book."
    else
        fnote::remove::book "$_book"
    fi
}

fnote::edit::note(){
    dnote edit "$1"
}

fnote::edit::book(){
    _note=$(fnote::select::note "$1")
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note from book ${1}"
    else
        fnote::edit::note "$_note"
    fi

}

fnote::edit(){
    _book="$(fnote::select::book)"
    if [ "$_book" == "-1" ]; then
        echo "Error when selecting a book."
    else
        fnote::edit::book "$_book"
    fi
}

fnote::view::book(){
    _note=$(fnote::select::note "$1")
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note from book ${1}"
    else
        fnote::view::note "$_note"
    fi
}

fnote::view(){
    _book="$(fnote::select::book)" 
    if [ "$_book" == "-1" ]; then
        echo "Error when selecting a book."
    else
        fnote::view::book "$_book"
    fi
}

fnote::copy::note(){
    dnote view "$1" --content-only | xclip -selection clipboard
}

fnote::copy::book(){
    _note=$(fnote::select::note "$1")
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note from book ${1}"
    else
        fnote::copy::note "$_note"
    fi
}

fnote::copy(){
    _book="$(fnote::select::book)"
    if [ "$_book" == "-1" ]; then
        echo "Error when selecting a book."
    else
        fnote::copy::book "$_book"
    fi
}

fnote::format-code-output(){
    if [ -z "$3" ]; then
        echo "$1" | bat --style="header,grid,numbers" --color=always --file-name="$2"
    else
        echo "$1" | bat --style="header,grid,numbers" --color=always --file-name="$2" -l "$3"
    fi 
}

fnote::extract-code-blocks(){
    echo "$1" | sed -n --expression='/^```/,/^```/ p' | sed '/^```/ d' 
}

fnote::extract-code-syntax(){
    _spec="$(echo "$1" | sed -n --expression='/^```/,/^```/ p' | grep -Eo '```[A-Z,a-z]+' | head -n 1)"
    echo "${_spec:3}" 
}

fnote::code::note(){
    _full="$(dnote view "$1")"
    _fname="$(fnote::format-note-title "$_full" "Code snippet(s) from")"
    _content="$(dnote view "$1" --content-only)"
    _syntax="$(fnote::extract-code-syntax "$_content")"
    _code="$(fnote::extract-code-blocks "$_content")"
    if [ -z "$_code" ]; then
        echo "No code blocks were specified in ${_fname:21}."
    else
        echo "Copying the following code to the clipboard:"
        echo ""
        fnote::format-code-output "$_code" "$_fname" "$_syntax"
        echo "$_code" | xclip -selection clipboard
    fi
}

fnote::code::book(){
    _note=$(fnote::select::note "$1")
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note from book ${1}"
    else
        fnote::code::note "$_note"
    fi

}

fnote::code(){
    _book="$(fnote::select::book)"
    if [ "$_book" == "-1" ]; then
        echo "Error when selecting a book."
    else
        fnote::code::book "$_book"
    fi
}

fnote::format-source-output(){
    echo "$1" | bat --style="header,grid,numbers" --color=always --file-name="$2"
}

fnote::extract-source(){
    _tag="$(echo "$1" | grep -Eo '\[Source\]\(.+\)')"
    echo "${_tag:9:-1}"
}

fnote::source::note(){
    _full="$(dnote view "$1")"
    _fname="$(fnote::format-note-title "$_full" "Source link(s) from")"
    _content="$(dnote view "$1" --content-only)"
    _src="$(fnote::extract-source "$_content")"
    if [ -z "$_src" ]; then
        echo "No source link was specified in ${_fname:20}"
    else
        echo "Copying the following source link(s) to the clipboard:"
        echo ""
        fnote::format-source-output "$_src" "$_fname"
        echo "$_src" | xclip -selection clipboard
    fi
}

fnote::source::book(){
    _note=$(fnote::select::note "$1")
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note from book ${1}"
    else
        fnote::source::note "$_note"
    fi
}

fnote::source(){
    _book="$(fnote::select::book)"
    if [ "$_book" == "-1" ]; then
        echo "Error when selecting a book."
    else
        fnote::source::book "$_book"
    fi
}

fnote::find-note(){
    _note="$(fnote::fnotes "$1")"
    if [ "$_note" == "-1" ]; then
        echo "Error when selecting a note."
    else
        fnote::view::note "$_note"
    fi
}

fnote(){
    if ! command -v dnote &> /dev/null; then
        echo "Error: Required dependency dnote does not appear to be installed."
    elif ! command -v fzf &> /dev/null; then
        echo "Error: Required dependency fzf does not appear to be installed."
    elif ! command -v bat &> /dev/null; then
        echo "Error: Required dependency bat does not appear to be installed."
    elif [ -z "$1" ]; then
        fnote::view
    else
        case "$1" in
            add|login|logout|sync|version)
                dnote $@
                ;;
            find)
                _notes="$(dnote $@)"
                fnote::find-note "$_notes" 
                ;;
            help)
                fnote::help
                ;;
            view)
                shift
                if [ -z "$1" ]; then
                    fnote::view
                elif [[ $1 =~ ^[0-9]+$ ]]; then
                    fnote::view::note "$1"
                else
                    fnote::view::book "$1"
                fi
                ;;
            edit)
                shift
                if [ -z "$1" ]; then
                    fnote::edit
                elif [[ $1 =~ ^[0-9]+$ ]]; then
                    fnote::edit::note "$1"
                else
                    fnote::edit::book "$1"
                fi
                ;;
            remove|delete)
                shift
                if [ -z "$1" ]; then
                    fnote::remove
                elif [[ $1 =~ ^[0-9]+$ ]]; then
                    fnote::remove::note "$1"
                else
                    fnote::remove::book "$1"
                fi
                ;;
            copy)
                if ! command -v xclip &> /dev/null; then
                    echo "Error: Required dependency xclip does not appear to be installed."
                else
                    shift
                     if [ -z "$1" ]; then
                        fnote::copy
                    elif [[ $1 =~ ^[0-9]+$ ]]; then
                        fnote::copy::note "$1"
                    else
                        fnote::copy::book "$1"
                    fi
                fi
                ;;
            get-code)
                if ! command -v xclip &> /dev/null; then
                    echo "Error: Required dependency xclip does not appear to be installed."
                else
                    shift
                    if [ -z "$1" ]; then
                        fnote::code
                    elif [[ $1 =~ ^[0-9]+$ ]]; then
                        fnote::code::note "$1"
                    else
                        fnote::code::book "$1"
                    fi
                fi
                ;;
            get-source)
                if ! command -v xclip &> /dev/null; then
                    echo "Error: Required dependency xclip does not appear to be installed."
                else
                    shift
                    if [ -z "$1" ]; then
                        fnote::source
                    elif [[ $1 =~ ^[0-9]+$ ]]; then
                        fnote::source::note "$1"
                    else
                        fnote::source::book "$1"
                    fi
                fi
                ;;

            *)
                echo "Error: Unsupported command ${1}."
                echo ""
                fnote::help
                ;;
        esac
    fi
}

complete -F _fnote_completions fnote
