let g:vimpsector_enable_mappings = 'HUMAN'
let g:vimpsector_base_dir=expand('$HOME/.config/vimspector')
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-bash-debug', 'debugger-for-chrome', 'vscode-node-debug2' ]

" Start/Stop
nnoremap <leader>il :call vimspector#Launch()<CR>
nnoremap <leader>ie :call vimspector#Reset()<CR>

" Zoom to the Window (GoToWindow defined by maximizer)
nnoremap <leader>zc :call GoToWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>zv :call GoToWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>zt :call GoToWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>zw :call GoToWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>zo :call GoToWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>zst :call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>

" Stepping
nmap <leader>isi <Plug>VimspectorStepInto
nmap <leader>iss <Plug>VimspectorStepOver
nmap <leader>iso <Plug>VimspectorStepOut
nnoremap <leader>ic :call vimspector#Continue()<CR>
nmap <leader>ir <Plug>VimspectorRestart

" Breakpoints
nmap <leader>bp <Plug>VimspectorToggleBreakpoint
nmap <leader>cbp <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>rth <Plug>VimspectorRunToCursor
nnoremap <leader>rbp :call vimspector#ClearBreakpoints()<CR>

" Popup of value of variable under cursor.
nmap <leader>ia <Plug>VimspectorBalloonEval

" Up and down the stack
"nmap [s <Plug>VimspectorUpFrame
"nmap ]s <Plug>VimspectorDownFrame

