let g:rc#dein#plugins['kana/vim-operator-replace'] = {
\   'on_map': '<Plug>',
\   'hook_add': 'call rc#plugin#operator#replace#hook_add()',
\ }

function! rc#plugin#operator#replace#hook_add() abort
  nmap ;R  <Plug>(operator-replace)
endfunction
