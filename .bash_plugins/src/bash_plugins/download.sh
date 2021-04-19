#!/bin/bash

_dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [ -z "$BP_SRC_DIR" ]; then
    src_dir="$(dirname "$_dir")"
else
    src_dir="$BP_SRC_DIR"
fi

forgit(){
    git clone https://github.com/wfxr/forgit.git
}

dotbare(){
    git clone https://github.com/kazhala/dotbare.git
}

mkdir -p "$src_dir"
_pwd="$(pwd)"
cd "$src_dir"
forgit
dotbare
cd "$_pwd"
