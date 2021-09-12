if (empty($BASHTHEME) || $BASHTHEME ==? "dark" || $BASHTHEME ==? "dark-min")
  " Manually specify concel color because no bg set.
  let g:limelight_conceal_ctermfg = 240
  let g:limelight_conceal_guifg = '#393e46'
endif

" Keep the hlsearch highlight
let g:limelight_priority=-1

nnoremap <leader>ll :Limelight!!<CR>
