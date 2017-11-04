let g:rc#dein#plugins['haya14busa/vim-edgemotion'] = {
\   'merged': 0,
\   'hook_source': 'call rc#plugin#edgemotion#hook_source()',
\   'hook_add': 'call rc#plugin#edgemotion#hook_add()',
\ }

function! rc#plugin#edgemotion#hook_source() abort
endfunction

function! rc#plugin#edgemotion#hook_add() abort
  map <C-j> <Plug>(edgemotion-j)
  map <C-k> <Plug>(edgemotion-k)
endfunction
