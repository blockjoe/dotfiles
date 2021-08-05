#!/bin/bash

_fapt_completions() {
	COMPREPLY+=("install")
	COMPREPLY+=("remove")
	COMPREPLY+=("purge")
	COMPREPLY+=("help")
}

complete -F _fapt_competions fapt
