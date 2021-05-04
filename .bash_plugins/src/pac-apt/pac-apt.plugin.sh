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

_apt::help(){
    echo "apt wrapper for pacman"
    echo "Usage: apt <command> [--flags] args"
    echo
    echo "Commands:"
    echo "  install  [--download-only] <packages>"
    echo "     pacman -S[w]"
    echo "  list <--installed|--upgradable>"
    echo "    pacman -Q | pacman -Qu"
    echo "  update"
    echo "    pacman -Sy (but not executed)"
    echo "  upgrade"
    echo "    pacman -Syu"
    echo "  search <query>"
    echo "    pacman -Ss <query>"
    echo "  autoclean"
    echo "    pacman -Sc"
    echo "  clean"
    echo "    pacman -Scc"
    echo "  autoremove"
    echo "    pacman -Qdtq | pacman -Rs -"
    echo "  show <package>"
    echo "    pacman -Si <package>"
    echo "  help"
    echo "    Show this help message."
}

_apt::install(){
    PARAMS=""
    _DLONLY=0
    while (( "$#" )); do
        case "$1" in
            --download-only)
                _DLONLY=1
                shift
                ;;
            -*|--*=) # unsupported flags
                echo "Error: Unsupported flag $1" >&2
                ;;
            *) # preserve positional arguments
                PARAMS="$PARAMS $1"
                shift
                ;;
        esac
    done

    # set positional arguments in their proper place
    eval set -- "$PARAMS"
    
    if [ "$_DLONLY" -eq 1 ]; then
        pacman -Sw $PARAMS
    else
        pacman -S $PARAMS
    fi
}

_apt::list(){
    PARAMS=""
    _INSTALLED=0
    _UPGRADABLE=0
    while (( "$#" )); do
        case "$1" in
            --installed)
                _INSTALLED=1
                shift
                ;;
            --upgradable)
                _UPGRADABLE=1
                shift
                ;;
            -*|--*=) # unsupported flags
                echo "Error: Unsupported flag $1" >&2
                ;;
            *) # preserve positional arguments
                PARAMS="$PARAMS $1"
                shift
                ;;
        esac
    done

    # set positional arguments in their proper place
    eval set -- "$PARAMS"
    
    if [ "$_INSTALLED" -eq 1 ]; then
        pacman -Q $PARAMS
    elif [ "$_UPGRADABLE" -eq 1 ]; then
        pacman -Qu $PARAMS
    else
        echo "Expected either '--installed' or '--upgradable' flag."
    fi
}

_apt::update(){
    echo "No need to update with pacman."
    echo "'pacman -Syu' handles both updating and upgrading in one command."
    echo "Running the 'apt upgrade' alias here is sufficient."
}   

_apt::upgrade(){
    pacman -Syu $@
}

_apt::search(){
    pacman -Ss $@
}

_apt::autoclean(){
    pacman -Sc $@
}

_apt::clean(){
    pacman -Scc $@
}

_apt::autoremove(){
    pacman -Qdtq | pacman -Rs -
}


_apt::show(){
    pacman -Si $@
}

apt(){
    if [ -z "$1" ]; then
        echo "Error: no command specified."
        apt::help
    fi
    case "$1" in
        install)
            shift
            _apt::install $@
            ;;
        list)
            shift
            _apt::list $@
            ;;
        update)
            _apt::update
            ;;
        upgrade)
            shift
            _apt::upgrade $@
            ;;
        search)
            shift
            _apt::search $@
            ;;
        autoclean)
            shift
            _apt::autoclean $@
            ;;
        clean)
            shift 
            _apt::clean $@
            ;;
        autoremove)
            shift
            _apt::autoremove $@
            ;;
        show)
            shift
            _apt::show $@
            ;;
        help)
            _apt::help
            ;;
        *)
            echo "Error: unsupported command ${1}"
            _apt::help
            ;;
    esac
}

complete -F _apt_completions apt
