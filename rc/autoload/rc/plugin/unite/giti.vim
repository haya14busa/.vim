let g:rc#dein#plugins['kmnk/vim-unite-giti'] = {
\   'on_source': 'unite.vim',
\   'hook_add': 'call rc#plugin#unite#giti#hook_add()',
\ }

function! rc#plugin#unite#giti#hook_add() abort
  nnoremap <silent> ;gg :<C-u>Unite giti/status<CR>
endfunction
