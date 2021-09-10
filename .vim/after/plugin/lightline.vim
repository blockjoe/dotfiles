set noshowmode
set background=dark
let g:lightline = {
      \ 'background' : 'dark',
      \ 'colorscheme': 'one',
      \ 'active': {
  \         'left': [['mode'],
                    \['readonly', 'filename', 'teststatus', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype', 'fileformat', 'fileencoding']]
  \     },
    \ 'component_function': {
      \ 'teststatus': 'TestStatus',
      \ 'asyncstatus': 'AsyncStatus'
    \ }
\ }
