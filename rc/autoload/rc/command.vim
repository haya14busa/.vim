function! rc#command#plug_edit(plugin_name) abort
  let config_dir = g:vimrc_root . '/rc/autoload/rc/plugin/'
  let fname = config_dir . a:plugin_name . '.vim'
  execute 'edit' fnameescape(fname)
endfunction
