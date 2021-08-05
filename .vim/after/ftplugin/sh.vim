" bash Runner
nmap <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw bash "$(VIM_FILEPATH)"<CR>
vnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw bash<CR>
" sh (dash/ash/POSIX) Runner
nmap <silent> <buffer> <C-F5> <ESC>:w<CR>:AsyncRun -raw sh "$(VIM_FILEPATH)"<CR>
vnoremap <silent> <buffer> <C-F5> :'<,'>AsyncRun -raw sh<CR>
