let g:rc#dein#plugins['Shougo/junkfile.vim'] = {}

command! -nargs=0 Junkfile call junkfile#open('%Y-%m-%d-%H%M%S.'->strftime())
