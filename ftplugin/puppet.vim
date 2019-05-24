setlocal tabstop=2 shiftwidth=2 softtabstop=2
let b:ale_fixers = ['puppetlint', 'trim_whitespace']
let g:ale_fix_on_save = 1
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
    \]
\}
