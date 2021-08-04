" Render markdown with <F5>
function! StartMarkdownPreview() abort
	let g:job_presenting = 1
	AsyncRun -raw grip -b "$(VIM_FILEPATH)"
endfunction

map <silent> <buffer> <F5> <ESC>:w<CR>:call StartMarkdownPreview()<CR>
