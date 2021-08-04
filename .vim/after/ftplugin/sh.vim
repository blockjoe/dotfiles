" bash Runner
map <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw bash "$(VIM_FILEPATH)"<CR>
xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw bash<CR>
" sh (dash/ash/POSIX) Runner
map <silent> <buffer> <C-F5> <ESC>:w<CR>:AsyncRun -raw sh "$(VIM_FILEPATH)"<CR>
xnoremap <silent> <buffer> <C-F5> :'<,'>AsyncRun -raw sh<CR>
