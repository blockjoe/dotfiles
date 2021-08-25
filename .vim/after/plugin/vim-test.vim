" Core

" use neomake for running strategy
let test#strategy = "neomake"
" don't open the run results
let g:neomake_open_list = 0
" Function for getting status of the last test.
function! TestStatus() abort
  return g:nm_job_status
endfunction

" Mappings
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
" Latest run test file from anywhere.
nnoremap <leader>tv :TestVisit<CR>
" Run nearest verbose (language specific)
nnoremap <leader>tm :echo "No nearest verbose function defined."<CR>
" Run nearest in debug (langauge specific)
nnoremap <leader>td :echo "No nearest debug function defined."<CR>

" Javascript
let g:test#javascript#runner = 'jest'
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'

function! JestDebugStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction
let g:test#custom_strategies = {'jest': function('JestDebugStrategy')}

function! RunJestDebug()
  let g:test#javascript#jest#options=''
  :TestNearest -strategy=jest
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction

function! RunJestVerbose()
  let g:test#javascript#jest#options=''
  :TestNearest -strategy="vimterminal"
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction

augroup JSMappings
  autocmd!
  autocmd Filetype javascript nnoremap <leader>tm :exec RunJestVerbose()<CR>
  autocmd Filetype javascript nnoremap <leader>td :exec RunJestDebug()<CR>
augroup END
