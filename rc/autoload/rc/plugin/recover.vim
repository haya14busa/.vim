let g:rc#dein#plugins['chrisbra/Recover.vim'] = {
\   'on_event': 'SwapExists',
\   'hook_source': 'call rc#plugin#recover#hook_source()',
\ }

function! rc#plugin#recover#hook_source() abort
  let g:RecoverPlugin_Edit_Unmodified = 1
endfunction
