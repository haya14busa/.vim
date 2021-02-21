let g:rc#dein#plugins['prabirshrestha/async.vim'] = {}
let g:rc#dein#plugins['prabirshrestha/vim-lsp'] = {
\   'hook_source': 'call rc#plugin#lsp#hook_source()',
\   'hook_add': 'call rc#plugin#lsp#hook_add()',
\ }

let g:rc#dein#plugins['prabirshrestha/asyncomplete.vim'] = {}
let g:rc#dein#plugins['prabirshrestha/asyncomplete-lsp.vim'] = {}

function! rc#plugin#lsp#hook_source() abort
endfunction

function! rc#plugin#lsp#hook_add() abort
  if executable('typescript-language-server')
    " autocmd FileType python NeoCompleteLock
    au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
    \ 'whitelist': ['typescript', 'typescript.tsx'],
    \ })
  endif

  if executable('vls')
    augroup LspVls
      au!
      au User lsp_setup call lsp#register_server({
      \ 'name': 'vue-language-server',
      \ 'cmd': {server_info->['vls']},
      \ 'whitelist': ['vue'],
      \ 'initialization_options': {
      \         'config': {
      \             'html': {},
      \              'vetur': {
      \                  'validation': {}
      \              }
      \         }
      \     }
      \ })
      " omnifunc
      au FileType vue setlocal omnifunc=lsp#complete
    augroup end
  endif

endfunction
