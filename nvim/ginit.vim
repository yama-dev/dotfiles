" ginit.vim

if IsWindows()
  map! <S-Insert> <C-R>+
  Guifont! Ricty:h11
  GuiLineSpace! -2
else
  Guifont! Ricty:h11
  GuiLineSpace! -2
endif

