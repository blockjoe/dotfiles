" # Basic Config #

" ## UTF-8 ##
set encoding=UTF-8
" ## vim not vi ##
set nocompatible

" ## Space as leader ##
let mapleader=' '

" ## No mode status since we have lightline ##
set noshowmode

" ## See leader command ##
set showcmd

" ## Hybrid line numbers ##
set number relativenumber

" ## Backspace ##
set backspace=start,eol,indent

" ## Last status ##
set laststatus=2

" ## Persistant Undo ##
set undodir=~/.vim/undodir
set undofile

" ## Delete comment character on joining commented lines ##
set formatoptions+=j

" ## Colors ##
set termguicolors

" ## COC Config ##
" https://github.com/neoclide/coc.nvim#example-vim-configuration
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

" # Normal Mode Mappings #

" ## Change Ex mode to last macro ##
nnoremap Q @@

" ## Spell Check ##
nnoremap <F3> :setlocal spell!<CR>

" ## Better split navigation ##
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ### Better tab navigation ###
au TabLeave * let g:lasttab = tabpagenr()
" <Alt-h/l> => prev/next
nnoremap h gT " <a-h>
nnoremap l gt " <a-l>
" <Alt-j/k> toggles between previous and last
nnoremap <silent> j :exe "tabn ".g:lasttab<CR>
nnoremap <silent> k :exe "tabn ".g:lasttab<CR>

" ## Easier delete to null register ##
nnoremap <leader>d "_d

" cd to file directory
nnoremap <leader>cd :lcd %:h<CR>

" open ~/.vimrc
nnoremap <leader>vimrc :vsp $MYVIMRC<CR>

" # Insert Mode Mappings #
" ## Quick Spellcheck fix ##
imap <C-Q> <Esc>[s1z=`]a

" # Internal Plugins #

" ## Syntax highlighting from ~/.vim/syntax ##
syntax enable

" ## Filtetype specific plugins from ~/.vim/ftplugin ##
filetype plugin on

" ## Filtetype based indenting from ~/.vim/indent ##
filetype indent on

" # Autocmds #

" ## Spellcheck on ##
autocmd FileType markdown setlocal spell

" ## Env Variable Overrides ##
let $FZF_DEFAULT_COMMAND.=' --hidden'

" # Loading External Plugins #

call plug#begin("~/.vim/plugged")

" ## Vim specific ##
" ### Custom text objects ###

Plug 'kana/vim-textobj-user'

Plug 'fvictorio/vim-textobj-backticks'
Plug 'kana/vim-textobj-diff'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/vim-textobj-url'
Plug 'adolenc/vim-textobj-toplevel'
Plug 'jasonlong/vim-textobj-css'
Plug 'rbonvall/vim-textobj-latex'
Plug 'coachshea/vim-textobj-markdown'
Plug 'bps/vim-textobj-python'

" ### Comment manipulations ###
Plug 'scrooloose/nerdcommenter'
" ### Date Incrementing ###
Plug 'tpope/vim-speeddating'
" ### Quote, (), and [] manipulations ###
Plug 'tpope/vim-surround'
" ### . support for plugins ###
Plug 'tpope/vim-repeat'
" ### Weird mix of case combination handling ###
Plug 'tpope/vim-abolish'

" ## Plugins with additional windows ##

" ### Project Tree view ###
Plug 'scrooloose/nerdtree'

" ### fzf ###
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" ## Language Syntax/Compilers ##

" ### A solid catchall ###
Plug 'sheerun/vim-polyglot'
" ### Solidity compiler ###
Plug 'dmdque/solidity.vim'
" ### HTML/JS/CSS ###
" Plug 'mattn/emmet-vim'
" ### JS Linter ###
" Plug 'eslint/eslint'
" ### JSON with Comments ###
Plug 'kevinoid/vim-jsonc'

" ## IDE-Like 'Behavior' Plugins  ##

" ### Highlighting of motion searches ###
Plug 'easymotion/vim-easymotion'
" ### COC ###
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
" ### Interactive Debugging ###
Plug 'puremourning/vimspector'

" Don't think I need these, now that COC is setup.
" ### Autocomplete ###
" Plug 'ackyshake/VimCompletesMe'
" ### Async Linter ###
" Plug 'w0rp/ale'
" ### ctags ###
" Plug 'ludovicchabant/vim-gutentags'

" ### Highlight and fix trailing whitespace ###
Plug 'ntpeters/vim-better-whitespace'
" ### Highlight what was yanked. ###
Plug 'machakann/vim-highlightedyank'
" ### Sublime-style multiple cursors ###
Plug 'mg979/vim-visual-multi', {'branch' : 'master'}
" ### Snippets ###
" Might not need with COC
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ## IDE-Like 'Rendering/Visual' Plugins ##

" ### Onedark Colorscheme ###
Plug 'joshdick/onedark.vim'
" ### Colored bracket matching ###
Plug 'frazrepo/vim-rainbow'
" ### Centered View, 'focus-mode' ###
Plug 'junegunn/goyo.vim'
" ### Dim all text not in current paragraph ###
Plug 'junegunn/limelight.vim'
" ### Status Line ###
Plug 'itchyny/lightline.vim'
" ### Hightlighting of hex color codes in that color ###
Plug 'ap/vim-css-color'
" ### UTF-8 font icons ###
Plug 'ryanoasis/vim-devicons'

call plug#end()

" # External Plugin Config #

" ## onedark colorscheme ##
" Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    let s:comment = { "gui" : "#737C8C", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Comment", { "fg": s:comment })
    let s:gutter = { "gui" : "#768098", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("LineNr", {"fg": s:gutter})
    let s:vert = { "gui" : "#70777e", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("VertSplit", {"fg": s:vert})
  augroup END
endif
colorscheme onedark

" ## COC ##
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
  \ "coc-tsserver",
  \ "coc-eslint",
  \ "coc-prettier",
  \ "coc-yaml",
  \ "coc-yank",
  \ "coc-snippets",
  \ "coc-html-css-support",
  \ "coc-marketplace" ]

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

" ctrl + space  to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Enter to confirm completetion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" JSDoc
autocmd FileType javascript nnoremap <silent> <leader>md :CocCommand docthis.documentThis<CR>

" ### easymotion ###

" Settings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

" Match to colorscheme
hi link EasyMotionTarget search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment

map <Leader> <Plug>(easymotion-prefix)

map s <Plug>(easymotion-s)
map <Leader>s <Plug>(easymotion-s2)
map <Leader>w <Plug>(easymotion-bd-w)

map <Leader>t <Plug>(easymotion-bd-fl)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>kb <Plug>(easymotion-sol-k)
map <Leader>ke <Plug>(easymotion-eol-k)
map <Leader>k <Plug>(easymotion-k)
map <Leader>jb <Plug>(easymotion-sol-j)
map <Leader>je <Plug>(easymotion-eol-j)
map <Leader>j <Plug>(easymotion-j)
map <Leader>h <Plug>(easymotion-linebackward)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" ### UltiSnips ###
let g:UltiSnipsExpandTrigger="<C-\\>"
let g:UltiSnipsJumpForwardTrigger="<C-\\>"
let g:UltiSnipsJumpBackwardTrigger="<C-]>"

" ## ALE ##
" let g:ale_fixers = {
"      \ 'javascript': ['prettier', 'eslint'],
"      \ 'soldity' : ['solhint']
"    \}
" let g:ale_linters_ignore = {'javascript': ['eslint']}


" ## Solidity Compiler ##
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make nested copen
augroup END

" ## Better Whitespace ##
nnoremap <C-f> :StripWhitespace<CR>

" ## Rainbow bracket matching ##
nnoremap <leader>bb :RainbowToggle<CR>


" ## Lightline ##
set background=dark
let g:lightline = {
      \ 'background' : 'dark',
      \ 'colorscheme': 'one',
      \ 'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['filetype', 'fileformat', 'fileencoding']]
  \     }
\ }

" ## NERDTree ##
nnoremap <leader>tt :NERDTreeToggle<CR>

" ## FZF ##
nnoremap <leader>ff :Files<CR>
nnoremap <leader>? :Maps<CR>
nnoremap <leader>sn :Snippets<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'alt-]': 'split',
            \ 'ctrl-]': 'vsplit',
            \ 'ctrl-o': '!open' }

" ## Goyo ##
nnoremap <leader>q :Goyo<CR>

" ## Limelight ##
nnoremap <leader>ll :Limelight!!<CR>
" Manually specify concel color because no bg set.
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#393e46'

" Keep the hlsearch highlight
let g:limelight_priority=-1

" ## Toggle Limelight when entering/leaving Goyo ##
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
