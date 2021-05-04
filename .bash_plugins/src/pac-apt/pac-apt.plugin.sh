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
}

complete -F _apt_completions apt
