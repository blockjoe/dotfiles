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

complete -F _fnote_completions fnote
