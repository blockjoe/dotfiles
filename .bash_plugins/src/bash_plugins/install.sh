#!/bin/bash

_dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [ -z "$BP_SRC_DIR" ]; then
    src_dir="$(dirname "$_dir")"
else
    src_dir="$BP_SRC_DIR"
fi
root_dir="$(dirname "$src_dir")"
if [ -z "$BP_INSTALL_DIR" ]; then
    install_dir="${root_dir}/installed"
else
    install_dir="$BP_INSTALL_DIR"
fi


forgit(){
 cp "${src_dir}/forgit/forgit.plugin.sh" "${install_dir}/forgit.plugin.sh"  
}

dotbare(){
 db_src="${src_dir}/dotbare"
 db_install="${install_dir}/dotbare.plugin.sh"
 cp "${db_src}/dotbare.plugin.bash" "$db_install" 
 
 # enable auto completion
 echo "_dotbare_completion_cmd" >> "$db_install"
 # point it to the right directory
 sed -i "s|.*mydir=.*|mydir=$db_src|" "$db_install"
}

fnote(){
 cp "${src_dir}/fnote/fnote.plugin.sh" "${install_dir}/fnote.plugin.sh"
}

fuzzysys(){
 cp "${src_dir}/fuzzy-sys/fuzzy-sys.plugin.zsh" "${install_dir}/fuzzy-sys.plugin.sh"
}

fzf-marks(){
 cp "${src_dir}/fzf-marks/fzf-marks.plugin.bash" "${install_dir}/fzf-marks.plugin.sh"
}

fzf-scripts(){
 cp "${src_dir}/fzf-scripts/sshget" "${install_dir}/bin/sshget"
}

fzf-interactively(){
 cp "${src_dir}/interactively/bin/interactively" "${install_dir}/bin/interactively"
 mkdir -p "$HOME/.history/fzf"
 if [ -f "$HOME/.bash_env_vars" ]; then
   if [[ -z $(grep "FZF_HISTORY_DIR" "$HOME/.bash_env_vars") ]]; then
     echo "export FZF_HISTORY_DIR='$HOME/.history/fzf'" >> "$HOME/.bash_env_vars"
   fi
 else
  echo "export FZF_HISTORY_DIR='$HOME/.history/fzf'" > "$HOME/.bash_env_vars" 
 fi
}

mkdir -p "$install_dir/bin"
forgit
dotbare
fnote
fuzzysys
fzf-marks
fzf-scripts
fzf-interactively
