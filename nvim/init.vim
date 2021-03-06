" init.vim

if &compatible
 set nocompatible
endif

"--------------------------------------------------
" Functions.

" Output message.
command! -nargs=0 EchoMessage call EchoMessage()
function! EchoMessage()
  put =execute('messages')
endfunction

" Detect env windows.
command! -nargs=0 IsWindows call IsWindows()
let s:is_windows = has('win32') || has('win64')
function! IsWindows()
  return s:is_windows
endfunction

" Toggle Fullscreen.
command! -nargs=0 ToggleFullScreen call ToggleFullScreen()
function! ToggleFullScreen()
  if g:GuiWindowMaximized == 0
    call GuiWindowMaximized(1)
  else
    call GuiWindowMaximized(0)
  endif
endfunction

"--------------------------------------------------
" Config.

" Python Path
if IsWindows()
  let g:python3_host_prog = fnameescape(expand('C:\Python37\python.exe'))
else
  let g:python3_host_prog = fnameescape(expand($HOME . '/.pyenv/shims/python'))
endif

let mapleader = "\<Space>"

"--------------------------------------------------
" Plugins. -> dein.vim

" Neovim設定ディレクトリ
let nvim_dir = $XDG_CONFIG_HOME . '/nvim/'

" deinの関連のパス
let dein_path = 'github.com/Shougo/dein.vim'
let dein_url = 'https://' . dein_path

" プラグインをインストールするディレクトリ
let dein_dir = nvim_dir . '.cache/dein/'
" dein.vim 本体
let dein_repo_dir = dein_dir . 'repos/' . dein_path
"
" dein.vimがなければインストールする
if !isdirectory(dein_repo_dir)
  execute '!git clone ' . dein_url dein_repo_dir
endif
" dein.vimをruntimepathへ追加
let &runtimepath = dein_repo_dir . "," . &runtimepath

" 設定開始
if dein#load_state(dein_dir)
  call dein#begin(dein_dir)

  call dein#add('Shougo/dein.vim',{'frozen' : 1})

  " プラグインリストファイル
  let s:toml = nvim_dir . 'plugins.toml'
  let s:lazy_toml = nvim_dir . 'plugins_lazy.toml'

  " プラグインリストを読み込みキャッシュする
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"--------------------------------------------------
" Settings.

" Search and Replace.
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

" Tabs.
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set shiftround

" Indent.
set autoindent
set smartindent

" Window size at startup.
set columns=160
set lines=50

" Line Number.
set number

" Command line.
set cmdheight=3
set wildmenu
set wildmode=list:longest,list:full
set wildchar=<tab>
set wildignore+=.git/*,.svn/*,.DS_Store,*.swp
set wildignore+=node_modules/*

" Format option.
set formatoptions+=mM

" Mouse
set mouse=a
set mousefocus

" Encoding.
set encoding=utf-8
set fileencoding=utf-8

" Backup.
set backup
set backupdir=~/.nvim/

" Set cd.
set autochdir

" Move cursor to move.
set whichwrap=b,s,h,l,<,>,[,]

" clip board.
set clipboard+=unnamedplus

" For IME.
" set ambiwidth=double

" Set Fold.
set foldmethod=manual   

" Set Syntax.
set conceallevel=0

" Display current line.
set cursorline

" set list
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"--------------------------------------------------
" Settings key-bind.

" Highlight cancellation by pressing Esc twice.
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" file type setting
augroup filetypeds
  autocmd!
  autocmd BufRead,BufNewFile,BufReadPre *.txt set filetype=markdown
  autocmd BufRead,BufNewFile,BufReadPre *.es set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.es6 set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.ejs set filetype=html
  autocmd BufRead,BufNewFile *.scss set filetype=scss.css
augroup END

" change tabsize.
map <F9> <C-w>10<
map <F10> <C-w>10>

" change tabsize.
map <F11> :ToggleFullScreen<CR>

" Settings For Search and Replace.
nnoremap / /\v
nnoremap <C-g> :vim **/* \| cw
nnoremap <C-g>f :/\( \\| \)
nnoremap <C-g>js :vim **/*.es6 \| cw
nnoremap <C-g>html :vim **/*.html \| cw
nnoremap <C-g>css :vim **/*.scss \| cw
nnoremap <C-h> :%s;;;gc
nnoremap <Leader>z /\zs\ze.*

" Grep.
autocmd QuickFixCmdPost *grep* cwindow

" Open new tab.
noremap <Leader>t :tabnew<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" move cursor line.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap <C-f> 20j
nnoremap <C-b> 20k

noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Not register overwrite.
xnoremap s "_s
nnoremap dd "_dd

" Add Line.
nnoremap <Leader>al  :%s/$/\r/gc<CR>
vnoremap <Leader>al  :s/$/\r/gc<CR>

" Delete Line.
nnoremap <Leader>dl  :%s/^$\n//gc<CR>
vnoremap <Leader>dl  :s/^$\n//gc<CR>

" Delete Space.
nnoremap <Leader>ds  :%s/\s\+//gc<CR>
vnoremap <Leader>ds  :s/\s\+//gc<CR>

"--------------------------------------------------
" Settings For Terminal.

" Instantly insert mode.
if has('nvim')
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
  autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
endif

" Paste register.
if has('nvim')
  tnoremap <expr> <A-v> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

"--------------------------------------------------
" Settings For HTML.

" Append br tag.
autocmd FileType xml,html inoremap <C-CR> <br>
" Append close tag.
autocmd Filetype xml,html inoremap <buffer> </ </<C-x><C-o>

"--------------------------------------------------
" Settings Other.

" Vim :w Use HHKB
map ; :

