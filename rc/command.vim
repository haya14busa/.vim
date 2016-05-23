command! -complete=customlist,rc#command#plug_edit_complete -nargs=1 PlugEdit call rc#command#plug_edit(<q-args>)

command! -nargs=? -complete=file Rename :echo rc#command#rename(<q-args>)

command! -nargs=? -complete=dir CD :echo rc#command#change_current_directory(<q-args>)

command! GitRoot :echo rc#command#git_root()

command! -bang ReloadVimrc :echom 'reload time<bang>: ' . rc#reload_vimrc('<bang>' == '!')

command! -bar TimerStart let s:start_time = reltime()
command! -bar TimerEnd echom reltimestr(reltime(s:start_time)) | unlet s:start_time
