" @param {boolean} force
function! rc#reload_vimrc(force) abort
  let start_time = reltime()
  let g:vimrc_force_reload = a:force
  if g:vimrc_force_reload
    runtime! rc/autoload/rc/**/*.vim
  endif
  execute 'source' fnameescape(g:vimrc)
  unlet g:vimrc_force_reload
  let time = reltimestr(reltime(start_time))
  return time
endfunction
