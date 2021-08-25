set noshowmode
set background=dark
let g:lightline = {
      \ 'background' : 'dark',
      \ 'colorscheme': 'one',
      \ 'active': {
  \         'left': [['mode'],
                    \['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'],
                    \['readonly', 'filename', 'teststatus', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype', 'fileformat', 'fileencoding']]
  \     },
    \ 'component_function': {
      \ 'teststatus': 'TestStatus',
      \ 'asyncstatus': 'AsyncStatus'
    \ }
\ }
