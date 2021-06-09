function! PyRunIntoSplit()
	execute '15new | read! python' shellescape(@%, 1) | setlocal bt=nofile bh=wipe nobl noswapfile nu nornu readonly nomodifiable
endfunction

" Current doesn't work
function PyRunSelIntoSplit()
	redir @"> | write !python | redir END | 15new | pu | setlocal bt=nofile bh=wipe nobl noswapfile nu nornu readonly nomodifiable
endfunction

" Run current file with F5 from normal and insert
map <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" Run current selection with F5 from visual
xnoremap <buffer> <F5> :w !python<CR>

" Run current file and open output in split
map <buffer> <C-F5> :w<CR>:call PyRunIntoSplit()<CR>
imap <buffer> <C-F5> <esc>:w<CR>:call PyRunIntoSplit()<CR>


