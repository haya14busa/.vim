scriptencoding utf-8

augroup MyVimrc
  autocmd!
augroup END

if !exists('g:syntax_on')
  syntax enable
endif

" undo {{{
if has('persistent_undo')
  let &undodir = g:vimrc_root .'/undo'
  set undofile "Automatically saves undo history
  set undoreload=1000 "Save the whole buffer for undo when reloading it
endif
"}}}
