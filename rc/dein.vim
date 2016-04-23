let s:base = fnamemodify(expand('<sfile>'), ':p:h')

let s:dein_dir = s:base . '/.dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

if !dein#load_state(s:dein_dir)
  finish
endif

let s:plugin_toml = s:base . '/dein.toml'
let s:plugin_toml_lazy = s:base . '/dein_lazy.toml'

call dein#begin(s:dein_dir, [s:plugin_toml])

call dein#load_toml(s:plugin_toml, {'lazy': 0})

call dein#end()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

call dein#save_state()
