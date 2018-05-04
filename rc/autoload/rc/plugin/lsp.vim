let g:rc#dein#plugins['prabirshrestha/async.vim'] = {}
let g:rc#dein#plugins['prabirshrestha/vim-lsp'] = {
\   'hook_source': 'call rc#plugin#lsp#hook_source()',
\   'hook_add': 'call rc#plugin#lsp#hook_add()',
\ }

function! rc#plugin#lsp#hook_source() abort
endfunction

function! rc#plugin#lsp#hook_add() abort
endfunction
