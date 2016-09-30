let g:rc#dein#plugins['chrisbra/vim-diff-enhanced'] = {
\   'on_event': 'FilterWritePre',
\   'hook_add': 'call rc#plugin#diff_enhanced#hook_add()',
\ }

function! rc#plugin#diff_enhanced#hook_add() abort
  " let &diffexpr = 'EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endfunction
