" Spellcheck on
setlocal spell

"Toggle conceal off when entering insert and back on when leaving
augroup ConcealToggle
	autocmd!
	autocmd InsertEnter * setlocal conceallevel=0
	autocmd InsertLeave * setlocal conceallevel=2
augroup END
