" Render markdown to Github HTML with <F5>
function! StartMarkdownHTMLPreview() abort
	let g:job_presenting = 1
	AsyncRun -raw grip -b "$(VIM_FILEPATH)"
endfunction

"Render markdown to PDF with <F6>
function! StartMarkdownPDFPreview() abort
	let g:job_presenting = 1
	AsyncRun -raw pandoc "$(VIM_FILEPATH)" -o %:p:r.pdf; xdg-open %:p:r.pdf; live-pandoc "$(VIM_FILEPATH)" -o %:p:r.pdf
endfunction

map <silent> <buffer> <F5> <ESC>:w<CR>:call StartMarkdownHTMLPreview()<CR>
map <silent> <buffer> <F6> <ESC>:w<CR>:call StartMarkdownPDFPreview()<CR>

"Toggle conceal off when entering insert and back on when leaving
augroup ConcealToggle
	autocmd!
	autocmd InsertEnter * setlocal conceallevel=0
	autocmd InsertLeave * setlocal conceallevel=2
augroup END
