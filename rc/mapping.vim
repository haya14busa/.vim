scriptencoding utf-8

" For Undo Revision, Break Undo Sequence "{{{
inoremap <CR> <C-g>u<CR>
inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
"}}}

" Emacs-like cursor move in insert/command-line mode "{{{
" :h mapmode-ic
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-a> <Home>
noremap! <C-e> <End>
" }}}

" Command line History {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"}}}

" Yank from cursor position to end of line
nnoremap Y y$

" Yank with keeping cursor position in visual mode {{{
function! s:keepcursor_visual_wrapper(command)
  execute 'normal! gv' . a:command
  execute "normal! gv\<ESC>"
endfunction
xnoremap <silent> y :<C-u>call <SID>keepcursor_visual_wrapper('y')<CR>
xnoremap <silent> Y :<C-u>call <SID>keepcursor_visual_wrapper('Y')<CR>
"}}}

" Repeat on every line {{{
" repeat last command for each line of a visual selection
vnoremap . :normal .<CR>
" replay @q macro for each line of a visual selection
vnoremap @q :normal @q<CR>
"}}}

" clear status
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>

" Select pasted text
nnoremap <expr>gp '`['.strpart(getregtype(),0,1).'`]'

" Don't use register by x
nnoremap x "_x

" Enter insert mode at the end of line (repeatable)
nnoremap gA A<C-g>U<Left>

" quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cpfile<CR>
nnoremap ]Q :cnfile<CR>

function! s:on_FileType_quickfix()
  noremap <buffer> p  <CR>zz<C-w>p
endfunction

autocmd MyVimrc FileType qf call s:on_FileType_quickfix()

nnoremap ;b :<C-u>ls<CR>:b<Space>

tnoremap <Esc><Esc> <C-\><C-n>

" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
