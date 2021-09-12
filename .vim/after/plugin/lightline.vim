set noshowmode

if (empty($BASHTHEME) || $BASHTHEME ==? "dark")
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
elseif $BASHTHEME ==? "dark-min"
  let g:lightline = {
        \ 'background' : 'dark',
        \ 'colorscheme': 'one',
        \ 'active': {
    \         'left': [['mode'],
                      \['readonly', 'filename', 'teststatus', 'modified']],
    \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype']]
    \     },
      \ 'component_function': {
        \ 'teststatus': 'TestStatus',
        \ 'asyncstatus': 'AsyncStatus'
      \ }
  \ }
elseif $BASHTHEME ==? "light"
  let g:lightline = {
        \ 'background' : 'light',
        \ 'colorscheme': 'PaperColor',
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
elseif $BASHTHEME ==? "light-min"
  let g:lightline = {
        \ 'background' : 'light',
        \ 'colorscheme': 'PaperColor',
        \ 'active': {
    \         'left': [['mode'],
                      \['readonly', 'filename', 'teststatus', 'modified']],
    \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype']]
    \     },
      \ 'component_function': {
        \ 'teststatus': 'TestStatus',
        \ 'asyncstatus': 'AsyncStatus'
      \ }
  \ }

endif

