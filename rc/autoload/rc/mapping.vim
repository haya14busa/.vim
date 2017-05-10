function! rc#mapping#yank2tmux(type, ...) abort
  if !executable('yank')
    echom 'yank not found'
    return
  endif
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use gv command.
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif

  call system('yank > /dev/tty', @@)

  let &selection = sel_save
  let @@ = reg_save
endfunction
