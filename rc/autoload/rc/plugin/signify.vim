let g:rc#dein#plugins['mhinz/vim-signify'] = {
\   'hook_add': 'call rc#plugin#signify#hook_add()',
\ }

function! rc#plugin#signify#hook_add() abort
  command! -nargs=1 SignifyTarget call s:change_target(<q-args>)
endfunction

function! s:change_target(target) abort
  if !exists('g:signify_vcs_cmds')
    runtime! autoload/sy/repo.vim
  endif
  if !exists('s:save_signify_vcs_cmds_git')
    let s:save_signify_vcs_cmds_git = g:signify_vcs_cmds.git
  endif
  let g:signify_vcs_cmds.git = 'git diff --no-color --no-ext-diff --no-prefix -U0 ' . a:target . ' -- %f'
  SignifyRefresh
  command! SignifyTargetReset :let g:signify_vcs_cmds.git = s:save_signify_vcs_cmds_git | delcommand SignifyTargetReset
endfunction
