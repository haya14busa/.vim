let g:rc#dein#plugins['tyru/open-browser.vim'] = {
\   'on_map': '<Plug>(openbrowser',
\   'hook_source': 'call rc#plugin#open_browser#hook_source()',
\   'hook_add': 'call rc#plugin#open_browser#hook_add()',
\ }

function! rc#plugin#open_browser#hook_source() abort
endfunction

function! rc#plugin#open_browser#hook_add() abort
  nmap <Leader>o <Plug>(openbrowser-smart-search)
  vmap <Leader>o <Plug>(openbrowser-smart-search)
endfunction
