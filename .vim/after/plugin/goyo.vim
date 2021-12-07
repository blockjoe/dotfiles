nnoremap <silent> <leader>g :Goyo<CR>

let g:goyo_width=100
let g:goyo_height=90

function! s:goyo_enter()
  hi LineNr ctermfg=240 guifg=#393e46
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  hi LineNr ctermfg=145 guifg=#768098
endfunction

augroup GoyoCallbacks
  autocmd!
  autocmd User GoyoEnter call <SID>goyo_enter()
  autocmd User GoyoLeave call <SID>goyo_leave()
augroup END

augroup GoyoLimelight
  autocmd!
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
augroup END
