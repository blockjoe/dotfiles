set expandtab ts=4 sw=4

" Spellcheck on
setlocal spell

"Toggle conceal off when entering insert and back on when leaving
augroup ConcealToggle
	autocmd!
	autocmd InsertEnter * setlocal conceallevel=0
	autocmd InsertLeave * setlocal conceallevel=2
augroup END

" Toggle syntax highlighting off to see spelling errors in front matter
nnoremap <leader>sc :call ToggleSyntax()<CR>

let b:syn_status = 1
function ToggleSyntax()
	if b:syn_status
		syntax off
		let b:syn_status = 0
	else
		syntax on
		let b:syn_status = 1
	endif
endfunction

