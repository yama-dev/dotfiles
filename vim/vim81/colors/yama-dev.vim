hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "koehler"
hi Normal		  guifg=white  guibg=black
hi Scrollbar	  guifg=darkcyan guibg=cyan
hi Menu			  guifg=black guibg=cyan
hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  guifg=#cc0000
hi NonText		  term=bold  cterm=bold  ctermfg=darkred  gui=bold      guifg=#cc0000
hi Directory	  term=bold  cterm=bold  ctermfg=brown  guifg=#cc8000
hi ErrorMsg		  term=standout  cterm=bold  ctermfg=grey  ctermbg=red  guifg=White  guibg=Red
hi Search		  term=reverse  ctermfg=white  ctermbg=red      guifg=white  guibg=Red
hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=SeaGreen
hi ModeMsg		  term=bold  cterm=bold  gui=bold  guifg=White	guibg=Blue
hi LineNr		  term=underline  cterm=bold  ctermfg=darkcyan	guifg=Yellow
hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=Green
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi StatusLineNC   term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
"hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold	guifg=Magenta
hi Title		  term=bold  cterm=bold  ctermfg=lightblue gui=bold	guifg=#e0ffff
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkred guifg=Red
hi Cursor		  guifg=bg	guibg=Green
"hi Comment		  term=bold  cterm=bold ctermfg=cyan guifg=#80a0ff
hi Comment		  term=bold  cterm=bold ctermfg=grey guifg=#666666
"hi Constant		  term=underline  cterm=bold ctermfg=magenta  guifg=#ffa0a0
hi Constant		  term=underline  cterm=bold ctermfg=cyan  guifg=#cccccc
hi Special		  term=bold  cterm=bold ctermfg=red  guifg=Orange
hi Identifier	  term=underline   ctermfg=brown  guifg=#40ffff
" hi Statement	  term=bold  cterm=bold ctermfg=yellow	gui=bold  guifg=#ffff60
hi Statement	  term=bold  cterm=bold ctermfg=brown gui=bold  guifg=#a52a2a
hi PreProc		  term=underline  ctermfg=darkmagenta   guifg=#ff80ff
"hi Type			  term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=#60ff60
hi Type			  term=underline  cterm=bold ctermfg=green gui=bold  guifg=#80a0ff
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black  guifg=Red	guibg=Black
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  guifg=Blue  guibg=Yellow
hi LineNr		  ctermfg=grey guifg=#777777
hi CursorLineNr	  ctermfg=white guifg=#ffffff
hi CursorLine	  term=underline  guibg=#222222 cterm=underline
hi CursorColumn	  term=underline  guibg=#222222 cterm=underline
hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Underlined	  term=underline cterm=bold,underline ctermfg=lightblue guifg=lightblue gui=bold,underline
hi Ignore		  ctermfg=black ctermbg=black guifg=black guibg=black
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
