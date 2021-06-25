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

" # Mappings #

" ## Leave Terminal ##
" Breaks fzf
" tnoremap <Esc> <C-\><C-n>

" ## Change Ex mode to last macro ##
nnoremap Q @@

" ## Spell Check ##
nnoremap <leader>sc :setlocal spell!<CR>

" ## Highlight search matches ##
nnoremap <leader>ss :set hlsearch!<CR>

" ## Better split navigation ##
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ## Easier delete to null register ##
nnoremap <leader>d "_d

" ## Two semicolons for Escape ##
imap ;; <Esc>

" cd to file directory
nnoremap <leader>cd :lcd %:h<CR>

" open ~/.vimrc
nnoremap <leader>vimrc :vsp $MYVIMRC<CR>

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
Plug 'mattn/emmet-vim'
" ### JS Linter ###
Plug 'eslint/eslint'

" ## IDE-Like 'Behavior' Plugins  ##

" ### Highlighting of motion searches ###
Plug 'easymotion/vim-easymotion'
" ### Async Linter ###
Plug 'w0rp/ale'
" ### Highlike and fix trailing whitespace ###
Plug 'ntpeters/vim-better-whitespace'
" ### Highlight what was yanked. ###
Plug 'machakann/vim-highlightedyank'
" ### Autocomplete ###
Plug 'ackyshake/VimCompletesMe'
" ### Sublime-style multiple cursors ###
Plug 'mg979/vim-visual-multi', {'branch' : 'master'}
" ### ctags ###
Plug 'ludovicchabant/vim-gutentags'
" ### Snippets ###
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

" ### easymotion ###
" Turn off default mappings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-\\>"

" ## ALE ##
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'soldity' : ['solhint']
    \}


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
