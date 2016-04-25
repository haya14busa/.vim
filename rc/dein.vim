let g:dein#types#git#clone_depth = 1
autocmd MyVimrc VimEnter * call dein#call_hook('post_source')

let s:base = fnamemodify(expand('<sfile>'), ':p:h')

let s:dein_dir = g:vimrc_root . '/.dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if !dein#load_state(s:dein_dir)
  finish
endif

let s:plugin_toml = s:base . '/plugin.toml'
let s:plugin_toml_lazy = s:base . '/plugin_lazy.toml'

call dein#begin(s:dein_dir, [expand('<sfile>'), s:plugin_toml, s:plugin_toml_lazy])

call dein#load_toml(s:plugin_toml, {'lazy': 0})
call dein#load_toml(s:plugin_toml_lazy, {'lazy': 1})

call dein#end()

if dein#check_install()
  call dein#install()
endif

call dein#save_state()
