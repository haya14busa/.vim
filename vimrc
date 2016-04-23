"=============================================================================
" Description: haya14busa's vimrc
" Author: haya14busa
" URL: https://github.com/haya14busa/.vim
" License: MIT license
"=============================================================================

let g:vimrc_root = fnamemodify(expand('<sfile>:p'), ':p:h')
let s:rc_base_dir = g:vimrc_root . '/rc/'

execute 'set runtimepath^=' . s:rc_base_dir

augroup MyVimrc
  autocmd!
augroup END

let s:vimrc = fnameescape(expand('<sfile>'))
command! ReloadVimrc :exe 'source ' s:vimrc

" @param {string} path 'relative to s:rc_base_dir(~/.vim/rc/)'
function! s:source_rc(path) abort
  execute 'source' fnameescape(s:rc_base_dir . a:path)
endfunction

call s:source_rc('dein.vim')
call s:source_rc('option.vim')
call s:source_rc('mapping.vim')

" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
