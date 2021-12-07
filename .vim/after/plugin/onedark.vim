" Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if ( empty($BASHTHEME) || $BASHTHEME ==? "dark" || $BASHTHEME ==? "dark-min")
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
  set background=dark
  colorscheme onedark
endif
