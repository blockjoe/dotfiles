" Vim Settings that COC needs
" See: https://github.com/neoclide/coc.nvim#example-vim-configuration

" TextEdit might fail
set hidden
" Some LSPs break on backups
set nobackup
set nowritebackup
" Less delays
set updatetime=300
" Don't pass messages to |ins-completion-menu|
set shortmess+=c
" Always show signcolumn
set signcolumn=yes

" extensions
let g:coc_global_extensions = [
  \ "coc-css",
  \ "coc-json",
  \ "coc-docker",
  \ "coc-docthis",
  \ "coc-markdownlint",
  \ "coc-markmap",
  \ "coc-reveal",
  \ "coc-pyright",
  \ "coc-react-refactor",
  \ "coc-sh",
  \ "coc-emmet",
  \ "coc-tsserver",
  \ "coc-eslint",
  \ "coc-prettier",
  \ "coc-yaml",
  \ "coc-yank",
  \ "coc-snippets",
  \ "coc-html-css-support",
  \ "coc-cmake",
  \ "coc-clangd",
  \ "coc-go",
  \ "coc-marketplace"]

" :Prettier will format the current buffer
command -nargs=0 Prettier :CocCommand prettier.formatFile
" marketplace available through :CocMP
command -nargs=0 CocMP :CocList marketplace

" TAB for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ctrl + @  to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" Enter to confirm completetion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" COC Language Specific Function and Class Text Objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

augroup HighlightUnderCursor
	autocmd!
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup JSDoc
	autocmd!
	autocmd FileType javascript nnoremap <silent> <leader>md :CocCommand docthis.documentThis<CR>
augroup END
