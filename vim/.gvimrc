" gvimrc

" Menu garbled
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" Menu.
set guioptions-=m
set guioptions-=T
nnoremap <C-m>o :set guioptions+=mT<CR>
nnoremap <C-m>c :set guioptions-=mT<CR>

if has('win32')
  " for Windows

  " Font Setttings.
  set guifont=Ricty_Diminished:h12
  set linespace=-1
  set renderoptions=type:directx
  set antialias

  " Set Transparency.
  autocmd GUIEnter * set transparency=200
  autocmd FocusGained * set transparency=220
  autocmd FocusLost * set transparency=120
elseif has('mac')
  " for Mac

  " Font Setttings.
  set guifont=Ricty:h15
  set linespace=-1
  set renderoptions=type:directx
  set antialias

  " Set Transparency.
  set transparency=8
endif

" 日本語入力に関する設定
if has('multi_byte_ime') || has('xim')
  " Cursor color.
  highlight CursorIM guibg=Red guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  " inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

