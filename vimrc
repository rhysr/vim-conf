" enable pathogen for managing plugins using git submodules
execute pathogen#infect()
execute pathogen#helptags()

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

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P "Status line

" spell check git commit messages
autocmd FileType gitcommit setlocal spell

""""""""""""""""""""
"    Colours
""""""""""""""""""""
set t_Co=256
set background=dark
colorscheme rhys
if &diff
    colorscheme elflord
endif

"""""""""""""""""""
" Syntax
""""""""""""""""""
syntax on
filetype plugin indent on

"PHP for non-standard extensions
if has("autocmd")
    augroup filetypedetect
        au! BufRead,BufNewFile *.phtml setfiletype php
        au! BufRead,BufNewFile *.twig setfiletype jinja
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

""""""""""""""
" Whitespace
""""""""""""""

if has ("autocmd")
    autocmd BufWritePre *.php,*.js,*.twig :call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre $HOME/repos/*,/var/repos/* :call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.clj :call Preserve("%s/\\s\\+$//e")
endif
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

"""""""""""""
" formatting
""""""""""""
nmap _= :call Preserve("normal gg=G")<CR>

""""""""""""""""""""""
" Functions 
""""""""""""""""""""""

" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

""""""""""""""""""""""
"      Plugins
""""""""""""""""""""""

" Taglist
""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Sort_Type = "name"
if has("autocmd")
    autocmd BufRead,BufNewFile $HOME/repos/*,/var/repos/* let tlist_php_settings = 'php;c:class;f:function;d:constant'
    " autocmd BufRead,BufNewFile $HOME/repos/* let Tlist_Ctags_Cmd = 'ctags --options=$HOME/.vim/ctags'
    autocmd BufWritePost $HOME/repos/*,/var/repos/* :TlistUpdate
    autocmd BufRead,BufNewFile $HOME/repos/logstash-conf/components/*conf set ft=logstash
endif

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

" Syntastic
""""""""""""

let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
let g:syntastic_puppet_puppetlint_args='--no-80chars-check --no-class_inherits_from_params_class-check'

let g:syntastic_ruby_rubocop_exec = '~/.vim/rubocop-system'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']


let g:DisableAutoPHPFolding = 1
let php_folding=0 

" Command-T
""""""""""""
let g:CommandTWildIgnore=&wildignore . ",data/**,build/**,bower_components/**,node_modules/**"
let g:CommandTMaxFiles=30000

"""""""""""""""""""""
"      Mess
""""""""""""""""""""

"php syntax highlighting
let php_sql_query=1
let php_htmlInStrings=1
let php_alt_comparisons=1

if has("autocmd")
    "php autocomplete method
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd Filetype puppet setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
endif


autocmd BufRead,BufNewFile riemann.config setlocal filetype=clojure
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
