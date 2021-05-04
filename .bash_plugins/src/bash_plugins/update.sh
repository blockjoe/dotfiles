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

fuzzysys(){
    cd "${src_dir}/fuzzy-sys"
    git pull --ff-only
}

fzf-marks(){
    cd "${src_dir}/fzf-marks"
    git pull --ff-only
}

fzf-scripts(){
    cd "${src_dir}/fzf-scripts"
    git pull --ff-only
}

fzf-interactively(){
    cd "${src_dir}/interactively"
    git pull --ff-only
}

_pwd="$(pwd)"
forgit
dotbare
fuzzysys
fzf-marks
fzf-scripts
fzf-interactively
cd "$_pwd"
