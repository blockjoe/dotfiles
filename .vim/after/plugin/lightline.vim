set noshowmode

function! LightlineMode()
  return &filetype ==# 'nerdtree' ? 'NERD' :
        \ lightline#mode()
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|nerdtree)' ? 'RO' : ''
endfunction

function! LightlineModified()
  return &filetype ==# 'nerdtree' ? '' : (&modified ? '+' : '')
endfunction

function! LightlineFilename()
  return &filetype ==# 'nerdtree' ? '' :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineFileformat()
  return &filetype ==# 'nerdtree' ? '' : &fileformat
endfunction

function! LightlineFiletype()
  return &filetype ==# 'nerdtree' ? '' : (&filetype !=# '' ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft')
endfunction

function! LightlineFileencoding()
  return &filetype ==# 'nerdtree' ? '' : (&fileencoding !=# '' ? &fileencoding : &encoding)
endfunction

if (empty($BASHTHEME) || $BASHTHEME ==? "dark")
  let g:lightline = {
        \ 'background' : 'dark',
        \ 'colorscheme': 'one',
        \ 'active': {
    \         'left': [['mode'],
                      \['readonly', 'filename', 'teststatus', 'modified']],
    \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype', 'fileformat', 'fileencoding']]
    \     },
      \ 'component_function': {
        \ 'mode' : 'LightlineMode',
        \ 'readonly' : 'LightlineReadonly',
        \ 'modified' : 'LightlineModified',
        \ 'filename' : 'LightlineFilename',
        \ 'fileformat' : 'LightlineFileformat',
        \ 'filetype' : 'LightlineFiletype',
        \ 'fileencoding' : 'LightlineFileencoding',
      \ }
  \ }
elseif $BASHTHEME ==? "dark-min"
  let g:lightline = {
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
        \ 'background' : 'dark',
        \ 'colorscheme': 'one',
        \ 'active': {
    \         'left': [['mode'],
                      \['readonly', 'filename', 'teststatus', 'modified']],
    \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype']]
    \     },
      \ 'component_function': {
        \ 'mode' : 'LightlineMode',
        \ 'readonly' : 'LightlineReadonly',
        \ 'modified' : 'LightlineModified',
        \ 'filename' : 'LightlineFilename',
        \ 'filetype' : 'LightlineFiletype',
      \ }
  \ }
elseif $BASHTHEME ==? "light"
  let g:lightline = {
        \ 'background' : 'light',
        \ 'colorscheme': 'PaperColor',
        \ 'active': {
    \         'left': [['mode'],
                      \['readonly', 'filename', 'teststatus', 'modified']],
    \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype', 'fileformat', 'fileencoding']]
    \     },
      \ 'component_function': {
        \ 'mode' : 'LightlineMode',
        \ 'readonly' : 'LightlineReadonly',
        \ 'modified' : 'LightlineModified',
        \ 'filename' : 'LightlineFilename',
        \ 'fileformat' : 'LightlineFileformat',
        \ 'filetype' : 'LightlineFiletype',
        \ 'fileencoding' : 'LightlineFileencoding',
      \ }
  \ }
elseif $BASHTHEME ==? "light-min"
  let g:lightline = {
  let g:lightline = {
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
        \ 'background' : 'light',
        \ 'colorscheme': 'PaperColor',
        \ 'active': {
    \         'left': [['mode'],
                      \['readonly', 'filename', 'teststatus', 'modified']],
    \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype']]
    \     },
      \ 'component_function': {
        \ 'mode' : 'LightlineMode',
        \ 'filename' : 'LightlineFilename',
        \ 'readonly' : 'LightlineReadonly',
        \ 'modified' : 'LightlineModified',
        \ 'filetype' : 'LightlineFiletype',
      \ }
  \ }

endif

