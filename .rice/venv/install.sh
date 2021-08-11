#!/bin/bash

dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

if ! [ $(id -u) = 0 ]; then
   echo "I am not root!"
   exit 1
fi

_pyVersions="3.3 3.4 3.5 3.6 3.7 3.8 3.9 3.10 3.11 3.12 3.13"

for _py in $_pyVersions; do
	if [ -d "/lib/python${_py}/venv/" ]; then
		if ! [ -f "/lib/python${_py}/venv/scripts/common/activate.bash" ]; then
			mv "/lib/python${_py}/venv/scripts/common/activate" "/lib/python${_py}/venv/scripts/common/activate.bash"
		fi
		cp "${dir}/activate" "/lib/python${_py}/venv/scripts/common/activate"
	fi
done
