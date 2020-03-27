setlocal tabstop=4 shiftwidth=4 softtabstop=4
let b:ale_fixers = ['eslint', 'trim_whitespace']
let g:ale_fix_on_save = 1

" fix unreadable purple text on red background when ale catches an error
highlight ALEError term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
