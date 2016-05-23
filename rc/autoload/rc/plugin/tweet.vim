let g:rc#dein#plugins['basyura/twibill.vim'] = {}
let g:rc#dein#plugins['basyura/TweetVim'] = {
\   'depends': 'twibill.vim',
\   'on_cmd': [
\     'TweetVimHomeTimeline',
\     'TweetVimMentions',
\     'TweetVimSay',
\     'TweetVimUserTimeline',
\     'TweetVimUserStream'
\   ],
\   'on_source': 'unite.vim',
\   'hook_source': 'call rc#plugin#tweet#hook_source()',
\   'hook_add': 'call rc#plugin#tweet#hook_add()',
\ }

function! rc#plugin#tweet#hook_source() abort
  let g:tweetvim_display_icon = 1
  let g:tweetvim_async_post = 1
  let g:tweetvim_tweet_per_page = 200
  let g:tweetvim_cache_size = 200
  let g:tweetvim_empty_separator = 1
  autocmd FileType tweetvim setlocal colorcolumn=0
  autocmd FileType tweetvim setlocal nonumber
endfunction

function! rc#plugin#tweet#hook_add() abort
endfunction
