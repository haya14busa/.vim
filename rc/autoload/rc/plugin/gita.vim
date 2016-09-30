let g:rc#dein#plugins['lambdalisue/vim-gita'] = {
\   'on_cmd': 'Gita',
\   'hook_add': 'call rc#plugin#gita#hook_add()',
\ }

function! rc#plugin#gita#hook_add() abort
  nnoremap ;gd :<C-u>Gita patch --two<CR>
endfunction
