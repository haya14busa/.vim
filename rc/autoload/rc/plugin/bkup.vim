let g:rc#dein#plugins['haya14busa/vim-bkup'] = {
\   'on_event': 'BufWritePre',
\   'hook_source': 'call rc#plugin#bkup#hook_source()',
\ }

function! rc#plugin#bkup#hook_source() abort
  let g:bkup#dir = g:vimrc_root . '/backup'
endfunction
