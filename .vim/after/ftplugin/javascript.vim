" Node Runner
map <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw node "$(VIM_FILEPATH)"<CR>
xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw node<CR>
