" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "rhys"

"hi Search		guifg=#d75f00	ctermfg=166
hi Search		guifg=black		guibg=orange	ctermfg=black	ctermbg=darkYellow
hi SpecialKey	guifg=#3a3a3a	ctermfg=237

"style folds
highlight Folded ctermbg=16 ctermfg=52
                                                                                                                                            
" colour line length overflows
highlight ColorColumn ctermbg=237
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 100)

" vim: sw=2
