"=============================================================================
" Description: haya14busa's vimrc
" Author: haya14busa
" URL: https://github.com/haya14busa/.vim
" License: MIT license
"=============================================================================

augroup MyVimrc
  autocmd!
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd MyVimrc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

let g:vimrc_root = fnamemodify(expand('<sfile>:p'), ':p:h')
let s:rc_base_dir = g:vimrc_root . '/rc/'

execute 'set runtimepath^=' . s:rc_base_dir

let s:vimrc = fnameescape(expand('<sfile>'))
command! ReloadVimrc :execute 'source ' s:vimrc

" @param {string} path 'relative to s:rc_base_dir(~/.vim/rc/)'
function! s:source_rc(path) abort
  execute 'source' fnameescape(s:rc_base_dir . a:path)
endfunction

call s:source_rc('dein.vim')
call s:source_rc('option.vim')
call s:source_rc('mapping.vim')

" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
