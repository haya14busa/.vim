function! s:hl_colorscheme_modify_molokai()
  if g:colors_name isnot# 'molokai'
    return
  endif
  highlight clear MatchParen
  highlight default MatchParen term=bold ctermfg=166 gui=bold guifg=#ef5939
  highlight clear Search
  highlight default Search term=bold cterm=bold ctermfg=196 ctermbg=24 guifg=#ff0000 guibg=#13354A
endfunction
autocmd MyVimrc ColorScheme * call s:hl_colorscheme_modify_molokai()

set background=dark
set t_Co=256
if &t_Co < 256
  colorscheme default
else
  try
    colorscheme molokai
  catch
  endtry
endif
