" Python Runner
map <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw python "$(VIM_FILEPATH)"<CR>
xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw python<CR>

