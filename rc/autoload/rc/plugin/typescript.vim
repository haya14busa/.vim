let g:rc#dein#plugins['leafgarland/typescript-vim'] = {
\   'hook_add': 'call rc#plugin#typescript#hook_add()',
\ }

function! rc#plugin#typescript#hook_add() abort
  " Add manually because of confliction
  " https://github.com/vim/vim/blob/67fa33460e0ea8568236fbf93b68619daa912bf7/runtime/filetype.vim#L2458-L2459
  autocmd MyVimrc BufNewFile,BufRead *.ts set filetype=typescript
  autocmd MyVimrc BufNewFile,BufRead *.ts setlocal shiftwidth=4 softtabstop=4
endfunction
