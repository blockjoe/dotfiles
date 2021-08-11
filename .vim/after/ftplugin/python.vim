" Python Runner
nmap <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw python "$(VIM_FILEPATH)"<CR>
vnoremap <silent> <buffer> <F5> :AsyncRun -raw python<CR>

