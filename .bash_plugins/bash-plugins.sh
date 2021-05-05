#!/bin/bash

_bp_completions(){
    COMPREPLY+=("help")
    COMPREPLY+=("init")
    COMPREPLY+=("clean")
    COMPREPLY+=("install")
    COMPREPLY+=("download")
    COMPREPLY+=("update")
    COMPREPLY+=("list")
}

_dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [ -z "$BP_SRC_DIR" ]; then
    src_dir="${_dir}/src"
else
    src_dir="$BP_SRC_DIR"
fi
root_dir="$(dirname "$src_dir")"
if [ -z "$BP_INSTALL_DIR" ]; then
    install_dir="${root_dir}/installed"
else
    install_dir="$BP_INSTALL_DIR"
fi

bp(){
    if ! [ -z "$2" ]; then
        echo "Error: too many arguments provided."
        echo ""    
        bp::help
    elif [ -z "$1" ]; then
        echo "Error: no command specified."
        echo "" 
        bp::help
    else
        case "$1" in
            help)
                bp::help
                ;;
            clean)
                bp::clean
                ;;
            download)
                bp::download
                ;;
            install)
                bp::install
                ;;
            update)
                bp::update
                ;;
            list)
                bp::list
                ;;
            init)
                bp::init
                ;;
            *)
                echo "Error: Unrecognized command ${1}"
                echo ""
                bp::help
                ;;
        esac
    fi
}

bp::help(){
    echo "Usage: bp COMMAND"
    echo "  A simple bash plugin manager"
    echo ""
    echo "Available Commands:"
    echo "  init      Download and install any plugins, best run when migrating to a new system."
    echo "  clean     Clear the installed directory, update, and install any plugins."
    echo "  download  Download any plugin source repositories."
    echo "  install   Install the specified plugins to the installed directory."
    echo "  update    Update any plugin source repositories."
    echo "  list      List all the plugins that currently are installed."
    echo "  help: Show this help string"
}

bp::list(){
    echo "Plugins currently installed in ${install_dir}:"
    echo
    _pwd="$(pwd)"
    if [ -d "$install_dir" ]; then
        cd "$install_dir"
        for i in *.sh; do
            [ -f "$i" ] || continue
            echo "  - $(basename "$i")"
        done
    else
        echo "No plugins currently installed."
    fi
    echo
    echo "Scripts currently installed in ${install_dir}/bin:"
    echo
    if [ -d "$install_dir/bin" ]; then
        cd "$install_dir/bin"
        for i in *; do
            [ -f "$i" ] || continue
            echo "  - $(basename "$i")"
        done
     else
        echo "No scripts currently installed."
    fi
    echo
    cd "$_pwd"
}

bp::init(){
    bp::download
    bp::install
}

bp::clean(){
    if [ -d "$install_dir" ]; then
        _pwd="$(pwd)"
        cd "$install_dir"
        rm *.sh
        cd "$_pwd"
    fi
    if [ -d "$install_dir/bin" ]; then
        rm -rf "$install_dir/bin"
    fi
    bp::update
    bp::install
}

bp::download(){
    . "${src_dir}/bash_plugins/download.sh"
}

bp::install(){
    . "${src_dir}/bash_plugins/install.sh"
}

bp::update(){
    . "${src_dir}/bash_plugins/update.sh"
}

complete -F _bp_completions bp
