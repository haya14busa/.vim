let g:rc#dein#plugins['sorah/unite-ghq'] = {
\   'hook_add': 'call rc#plugin#unite#ghq#hook_add()',
\ }

function! rc#plugin#unite#ghq#hook_add() abort
  nnoremap <silent> go :<C-u>Unite ghq<CR>
endfunction
