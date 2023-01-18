redir @"
silent! execute "hi Normal"
redir END

let output = copy(@")
let g:normalHiArgs = join(split(output)[-2:])

function! AnsiWrapper()
  let bn=bufnr("%")
  if exists("s:AnsiEsc_enabled_{bn}") && s:AnsiEsc_enabled_{bn}
    call AnsiEsc#AnsiEsc(1)
    call AnsiEsc#AnsiEsc(0)
  else
    call AnsiEsc#AnsiEsc(0)
  endif
  hi Normal guibg=NONE ctermbg=NONE
endfunction



augroup quickfix
  autocmd!
  autocmd FileType qf setlocal conceallevel=2
  autocmd Filetype qf call AnsiWrapper()
augroup END

