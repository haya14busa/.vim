let g:rc#dein#plugins = get(g:, 'rc#dein#plugins', {})

let g:dein#types#git#clone_depth = 1
autocmd MyVimrc VimEnter * call dein#call_hook('post_source')

let s:base = fnamemodify(expand('<sfile>'), ':p:h')

let s:dein_dir = g:vimrc_root . '/.dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if !dein#load_state(s:dein_dir)
  filetype plugin indent on
  finish
endif

let s:plugin_toml = s:base . '/plugin.toml'
let s:plugin_toml_lazy = s:base . '/plugin_lazy.toml'

call dein#begin(s:dein_dir, [])

call dein#load_toml(s:plugin_toml, {'lazy': 0})
call dein#load_toml(s:plugin_toml_lazy, {'lazy': 1})

runtime! rc/autoload/rc/plugin/**/*.vim
call dein#load_dict(g:rc#dein#plugins)

let s:local_plugin_dir = s:dein_dir . '/repos/local/haya14busa'
call dein#local(s:local_plugin_dir, {'merge': 0})

call dein#end()
call dein#save_state()

if !has('vim_starting')
  if dein#check_install()
    call dein#install()
  endif

  call dein#recache_runtimepath()

  call dein#call_hook('add')
  call dein#call_hook('source')
  call dein#call_hook('post_source')
endif

filetype plugin indent on

function! s:check_lazy_plugins() abort
  let check_lazy_plugins = dein#check_lazy_plugins()
  if len(check_lazy_plugins) > 0
    echom 'There are nonsense lazy plugins: ' . string(check_lazy_plugins)
  endif
endfunction

call s:check_lazy_plugins()
