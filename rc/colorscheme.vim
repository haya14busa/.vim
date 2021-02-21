function! s:hl_colorscheme_modify_molokai()
  if g:colors_name isnot# 'molokai'
    return
  endif
  highlight clear MatchParen
  highlight default MatchParen term=bold ctermfg=166 gui=bold guifg=#ef5939
  highlight clear Search
  highlight default Search term=bold cterm=bold ctermbg=24 guibg=#13354A ctermfg=244 guifg=#808080
endfunction
autocmd MyVimrc ColorScheme * call s:hl_colorscheme_modify_molokai()

set background=light
set t_Co=256
if &t_Co < 256
  colorscheme default
else
  try
    " colorscheme molokai
    colorscheme one
  catch
  endtry
endif
