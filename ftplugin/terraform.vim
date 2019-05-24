let b:ale_fixers = ['terraform', 'trim_whitespace']
let g:ale_fix_on_save = 1

let g:tagbar_type_terraform = {
    \ 'ctagstype' : 'terraform',
    \ 'kinds' : [
        \ 'r:Resources',
        \ 'd:Datas',
        \ 'v:Variables',
        \ 'p:Providers',
        \ 'o:Outputs',
        \ 'm:Modules',
        \ 'f:TFVars'
    \ ],
    \ 'sort' : 1
\ }
