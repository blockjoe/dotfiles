#!/bin/bash

_dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [ -z "$BP_SRC_DIR" ]; then
    src_dir="$(dirname "$_dir")"
else
    src_dir="$BP_SRC_DIR"
fi

forgit(){
    cd "${src_dir}/forgit"
    git pull --ff-only
}

dotbare(){
    cd "${src_dir}/dotbare"
    git pull --ff-only
}

forgit
dotbare
