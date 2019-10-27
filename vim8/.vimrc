" vimrc

"--------------------------------------------------
" Import
source $HOME/functions.vim
source $HOME/coc.vim

"--------------------------------------------------
" Setting Plugin.

if IsWindows()
  if has('nvim')
  else
    set runtimepath+=$VIM
    set pythonthreedll=$VIM/python3/python37.dll
  endif
endif

if has('python3')
  " Python Path
  if IsWindows()
    let g:python3_host_prog = fnameescape(expand($VIM.'/python3/python.exe'))
  else
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif

if &compatible
  set nocompatible
endif

" 設定ディレクトリ
let s:vim_dir = $VIM
let s:home_dir = $HOME

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(s:home_dir . '/.cache/dein')
  call dein#begin(s:home_dir . '/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add(s:home_dir . '/.cache/dein/repos/github.com/Shougo/dein.vim')

  " プラグインリストファイル
  let s:toml = s:home_dir . '/plugins.toml'
  let s:lazy_toml = s:home_dir . '/plugins_lazy.toml'

  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})

  " プラグインリストを読み込みキャッシュする
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif

"--------------------------------------------------
" Settings.

" Common.
let g:mapleader = "\<Space>"
set shellslash

" Search and Replace.
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
if has('nvim')
  set inccommand=split
endif

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
" set mousefocus

" Encoding.
set encoding=utf-8
set fileencoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
scriptencoding utf-8

" Backup.
set noswapfile
set noundofile
set backup
set backupdir=~/.vim/

" Set cd.
if has('autochdir')
  set autochdir
endif

" Move cursor to move.
set whichwrap=b,s,h,l,<,>,[,]

" clip board.
if has('nvim')
  set clipboard+=unnamedplus
endif

" For IME.
if has('ambiwidth')
  set ambiwidth=auto
endif

" Set Fold.
set foldmethod=manual

" Set Syntax.
set conceallevel=0
set synmaxcol=300

" Display current line.
set cursorline
set cursorcolumn

" set list
set listchars=tab:>-,extends:<,trail:-,eol:<
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" Set Viminfo.
set viminfo='20,f1,<500,s100,h,%
set viminfo+=n~/.vim/viminfo

set spell
set spelllang=en,cjk

set autoread

set virtualedit=onemore

set visualbell

set showmatch

" file type setting
augroup AutoCmdFiletype
  autocmd!
  autocmd FileType html,markdown set synmaxcol=250
  autocmd BufRead,BufNewFile,BufReadPre *.txt set filetype=markdown
  autocmd BufRead,BufNewFile,BufReadPre *.es set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.es6 set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.ejs set filetype=html
  autocmd BufRead,BufNewFile,BufReadPre *.scss set filetype=scss
  autocmd BufRead,BufNewFile,BufReadPre *.toml set filetype=toml
augroup END

"--------------------------------------------------
" Settings key-bind.

" Highlight cancellation by pressing Esc twice.
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" change tabsize.
map <F9> <C-w>10<
map <F10> <C-w>10>

" change tabsize.
map <F11> :ToggleFullScreen<CR>

" Settings For Search and Replace.
nnoremap / /\v
nnoremap <C-g> :vimgrep **/* \| cw
nnoremap <C-g>g :vimgrep /^.*js\-.*js.*$/ **/*.js | cw
nnoremap <C-g>f :/\( \\| \)
nnoremap <Leader>h :%s;;;gc
nnoremap <Leader>z /\zs\ze.*

" Grep.
autocmd QuickFixCmdPost *grep* cwindow

" Open new tab.
nnoremap <Leader>t :tabnew<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" move cursor line.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap <C-f> 20j
nnoremap <C-b> 20k

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <C-h> ^
nnoremap <C-l> g_

vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap <C-h> ^
vnoremap <C-l> g_

inoremap <C-j> <ESC>10ja
inoremap <C-k> <ESC>10ka
inoremap <C-h> <ESC>10ha
inoremap <C-l> <ESC>10la

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

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

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

augroup AutoCmdHtml
  autocmd!
  " Append br tag.
  autocmd FileType xml,html inoremap <C-CR> <br>
  " Append close tag.
  autocmd Filetype xml,html inoremap <buffer> </ </<C-x><C-o>
augroup END

"--------------------------------------------------
" Settings Other.

" Vim :w Use HHKB
map ; :

set ttimeoutlen=50

nnoremap Zz :w<CR>:bd<CR>

augroup vimrc-highlight
  autocmd!
  autocmd Syntax sql if 1000 < line('$') | syntax sync minlines=100 | endif
augroup END
