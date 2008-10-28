" Vim color file
" Maintainer:	Nicolas Cavigneaux <nico@bounga.org>
" Last Changed:	08/06/2005 - 21:28:25 (CEST)
" Version:      0.1

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "bounga"

" GUI
highlight Normal     guifg=Grey80	guibg=Black
highlight Constant   guifg=White
highlight Search     guifg=Black	guibg=Red	    gui=bold
highlight Visual     guifg=Grey25			        gui=bold
highlight Cursor     guifg=Black	guibg=Green	    gui=bold
highlight Special    guifg=Orange
highlight PreProc    guifg=indianred
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=Yellow			        gui=NONE
highlight Type						                gui=NONE

" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Constant   ctermfg=White
highlight PreProc    guifg=indianred
highlight Search     ctermfg=Black	    ctermbg=Red	    cterm=NONE
highlight Visual					                    cterm=reverse
highlight Cursor     ctermfg=Black	    ctermbg=Green	cterm=bold
highlight Special    ctermfg=Brown
highlight PreProc    ctermfg=Red
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue	    ctermbg=white
highlight Statement  ctermfg=Yellow
highlight Type						                    cterm=NONE

"vim: sw=4
