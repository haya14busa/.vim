let g:rc#dein#plugins['miyakogi/seiya.vim'] = {
\   'hook_add': 'call rc#plugin#seiya#hook_add()',
\   'if': "!has('gui_running')",
\ }

function! rc#plugin#seiya#hook_add() abort
  let g:seiya_auto_enable = !has('gui_running')
endfunction
