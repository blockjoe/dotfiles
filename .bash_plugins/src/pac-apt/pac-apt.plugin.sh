#!/bin/bash

_apt_completions(){
    COMPREPLY+=("help")
    COMPREPLY+=("install")
    COMPREPLY+=("upgrade")
    COMPREPLY+=("list")
    COMPREPLY+=("update")
    COMPREPLY+=("show")
    COMPREPLY+=("search")
    COMPREPLY+=("autoclean")
    COMPREPLY+=("clean")
    COMPREPLY+=("autoremove")
    COMPREPLY+=("remove")
}

complete -F _apt_completions apt
