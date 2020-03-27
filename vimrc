scriptencoding utf-8
set encoding=utf-8

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'garbas/vim-snipmate'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/rainbow_parentheses.vim'
Plug 'leafoftree/vim-vue-plugin'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'

" language plugins
Plug 'sheerun/vim-polyglot'
Plug 'robbles/logstash.vim'

call plug#end()

""""""""""""""""""""""""
"     Editor Settings
""""""""""""""""""""""""
set number "add line numbers
set backspace=indent,eol,start "make backspace start working again... http://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi

set tabstop=4      "how wide tabs are, display only
set shiftwidth=4   "how much a tab indents existing text
set softtabstop=4  "how many columns a tab uses in insert mode
set expandtab

set cindent        "indent inside braces basically
set smartindent
set autoindent
set history=1000

" command tab completion
set wildmenu
set wildmode=list:longest,full

" Invisibles
set list
set listchars=tab:\|·,trail:·

nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

set undofile "persistent undo between opening and closing vim
set hid "Hide abandon buffers in order to not lose undo history.

set incsearch "search as you type
set hlsearch "highlight search
set ignorecase
set smartcase

set scrolloff=6 " keep cursor away from bottom of screen

" searches appear in middle of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" hide search highlights
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" allow reading editor config from file
set nocompatible
set modeline
set modelines=1

""""""""""""""""""""
"    Colours
""""""""""""""""""""
set t_Co=256
set background=dark
colorscheme rhys
if &diff
    colorscheme industry
endif

"""""""""""""""""""
" Syntax
""""""""""""""""""
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"PHP for non-standard extensions
if has("autocmd")
    augroup filetypedetect
        au! BufRead,BufNewFile *.phtml setfiletype php
        au! BufRead,BufNewFile riemann.config setlocal filetype=clojure
        au! BufRead,BufNewFile Vagrantfile setlocal filetype=ruby
    augroup END
endif

""""""""""""""""""""""
"      Bindings
""""""""""""""""""""""
inoremap jj <Esc>

"disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"source .vimrc
nmap <Leader>s :source $MYVIMRC<CR>

" easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""
"      Plugins
""""""""""""""""""""""

" Tagbar
"""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left=1

" BufExplorer
""""""""""""""
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
if has("autocmd")
    "fix issue with bufexplorer disable listchars
    autocmd BufEnter,BufNew,BufRead,BufNewFile * set list
endif

" Supertab
""""""""""
let g:SuperTabDefaultCompletionType = "context"

" Command-T
""""""""""""
let g:CommandTWildIgnore=&wildignore . ",data/**,build/**,bower_components/**,node_modules/**"
let g:CommandTMaxFiles=30000

" Ctrl P
"""""""""""""""
let g:ctrlp_custom_ignore = '\/(node_modules|build)\/'
let g:ctrlp_max_files = 80000
let g:ctrlp_max_depth = 12
nnoremap <C-b> :CtrlPBuffer<CR>

" ALE
"""""""""
let g:ale_lint_delay=1000
let g:ale_pattern_options = {
\   'node_modules/*': {'ale_enabled': 0}
\}


"""""""""""""""""""""
"      Mess
""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" https://stackoverflow.com/questions/26518938/vim-wrong-syntax-highlighting-in-groovy#comment66713285_26525247
"syn region groovyString           start='/[^ \*/]'  end='/' contains=groovySpecialChar,groovyRegexChar,groovyELExpr

" https://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set undodir=~/.vimundo//,/var/tmp//,/tmp//,.

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
