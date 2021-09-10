#!/bin/bash

dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"


_pyVersions="3.3 3.4 3.5 3.6 3.7 3.8 3.9 3.10 3.11 3.12 3.13"

for _py in $_pyVersions; do
	if [ -d "${PREFIX}/lib/python${_py}/venv/" ]; then
		if ! [ -f "${PREFIX}/lib/python${_py}/venv/scripts/common/activate.bash" ]; then
			mv "${PREFIX}/lib/python${_py}/venv/scripts/common/activate" "${PREFIX}/lib/python${_py}/venv/scripts/common/activate.bash"
		fi
		cp "${dir}/activate" "${PREFIX}/lib/python${_py}/venv/scripts/common/activate"
	fi
done
