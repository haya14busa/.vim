let g:rc#dein#plugins['haya14busa/vim-hinttab'] = {
\   'hook_add': 'call rc#plugin#hinttab#hook_add()',
\ }

function! rc#plugin#hinttab#hook_add() abort
  nmap ;gt <Plug>(hinttab-move)
endfunction
