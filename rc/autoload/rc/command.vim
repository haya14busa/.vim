function! rc#command#plug_edit(plugin_name) abort
  let config_dir = g:vimrc_root . '/rc/autoload/rc/plugin/'
  let fname = config_dir . a:plugin_name . '.vim'
  execute 'edit' fnameescape(fname)
endfunction

function! rc#command#rename(newfilename) abort
  let newfilename = a:newfilename
  if newfilename is# ''
    let newfilename = input('', expand('%'), 'file')
  endif
  execute 'silent file' fnameescape(newfilename)
  execute 'silent write'
  call delete(expand('#'))
  return newfilename
endfunction


function! rc#command#plug_edit_complete(ArgLead, CmdLine, CursorPos) abort
  let config_dir = g:vimrc_root . '/rc/autoload/rc/plugin/'
  let files = split(globpath(config_dir, '*.vim'), "\n")
  return filter(map(files, "fnamemodify(v:val, ':t:r')"), 'v:val =~# "^" . a:ArgLead')
endfunction

function! rc#command#change_current_directory(directory) abort
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' a:directory
  endif
  return getcwd()
endfunction

function! rc#command#git_root() abort
  if !rc#utils#is_in_git_repository()
    return 'Not in git repository'
  endif
  let topdir = rc#utils#execute(['git', 'rev-parse', '--show-toplevel'])
  return rc#command#change_current_directory(topdir)
endfunction
