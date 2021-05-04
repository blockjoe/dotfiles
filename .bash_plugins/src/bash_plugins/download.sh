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

fuzzysys(){
    git clone https://github.com/NullSense/fuzzy-sys.git
}

fzf-marks(){
    git clone https://github.com/urbainvaes/fzf-marks.git
}

fzf-scripts(){
    git clone https://github.com/DanielFGray/fzf-scripts.git
}

fzf-interactively(){
    git clone https://github.com/bigH/interactively.git
}

mkdir -p "$src_dir"
_pwd="$(pwd)"
cd "$src_dir"
forgit
dotbare
fuzzysys
fzf-marks
fzf-scripts
fzf-interactively
cd "$_pwd"
