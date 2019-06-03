setlocal tabstop=2 shiftwidth=2 softtabstop=2
let b:ale_fixers = ['tslint', 'eslint', 'trim_whitespace']
let g:ale_fix_on_save = 1

" fix unreadable purple text on red background when ale catches an error
highlight ALEError term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'l:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
