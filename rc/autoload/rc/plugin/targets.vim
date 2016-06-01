let g:rc#dein#plugins['wellle/targets.vim'] = {
\   'hook_add': 'call rc#plugin#targets#hook_add()',
\ }

function! rc#plugin#targets#hook_add() abort
  " Disable `n` , `l` , `A`
  let g:targets_aiAI = 'ai I'
  let g:targets_nlNL = '  NL'
endfunction

