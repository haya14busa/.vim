let g:rc#dein#plugins['k0kubun/unite-git-files'] = {
\   'hook_add': 'call rc#plugin#unite#git_files#hook_add()',
\ }

function! rc#plugin#unite#git_files#hook_add() abort
  nnoremap <Space><Space> :<C-u>Unite git_files -start-insert<CR>
endfunction

