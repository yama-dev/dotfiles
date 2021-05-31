""" vimrc

""" reset augroup
augroup MyAutoCmd
autocmd!
augroup END

"--------------------------------------------------
""" Import

source $HOME/vimfiles/functions.vim

"--------------------------------------------------
""" Setting Plugin.

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

" set directory.
let s:vim_dir = $VIM
let s:home_dir = $HOME

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" download dein.vim
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
endif

" dein plugins
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  call dein#add(s:dein_repo_dir)

  " plugin toml file.
  let s:toml = s:home_dir . '/vimfiles/plugins.toml'
  let s:lazy_toml = s:home_dir . '/vimfiles/plugins_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim_starting') && dein#check_install()
 call dein#install()
endif

let g:dein#auto_recache = 1

"--------------------------------------------------
""" Settings.

""" Common.
let g:mapleader = "\<Space>"
set shellslash

""" Search and Replace.
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
if has('nvim')
  set inccommand=split
endif

""" Tabs.
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set shiftround

""" Indent.
set autoindent
set smartindent

""" Window size at startup.
set columns=160
set lines=50

""" Line Number.
set number
" set relativenumber

""" diff
set diffopt=internal,filler,iwhiteall,vertical

set cmdheight=3
""" Command line.
set wildmenu
set wildmode=list:longest,list:full
set wildchar=<tab>
set wildignore+=.git/*,.svn/*,.DS_Store,*.swp
set wildignore+=node_modules/*

""" Format option.
set formatoptions+=mM

""" Mouse
set mouse=a
" set mousefocus

""" Encoding.
set encoding=utf-8
set fileencoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
scriptencoding utf-8

set noswapfile
set noundofile
""" Backup file settings (file.txt~)
set backup
set backupdir=~/.vim/

" Set cd.
if has('autochdir')
  set autochdir
endif

""" Move cursor to move.
set whichwrap=b,s,h,l,<,>,[,]

""" clip board.
if has('nvim')
  set clipboard+=unnamedplus
endif

""" For IME.
" set ambiwidth=single
set ambiwidth=double

""" Set Fold.
set foldmethod=manual
" manual: 手動で折畳を定義する
" indent: インデントの数を折畳のレベル(深さ)とする
" expr:   折畳を定義する式を指定する
" syntax: 構文強調により折畳を定義する
" diff:   変更されていないテキストを折畳対象とする
" marker: テキスト中の印で折畳を定義する

""" Set Syntax.
set conceallevel=0
set synmaxcol=300

""" Display current line.
" set cursorline
" set cursorcolumn

" set list
set listchars=tab:>-,extends:<,trail:-,eol:<
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

""" Set Viminfo.
set viminfo='20,f1,<500,s100,h,%
set viminfo+=n~/.vim/viminfo

" set spell
" set spelllang=en,cjk

set autoread

set virtualedit=onemore

set visualbell

set showmatch

set scrolloff=3
""" scroll offset.

""" enable backspace.
set backspace=indent,eol,start

" remove scroll bar.
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

set wrap

""" file type setting
augroup AutoCmdFiletype
  autocmd!
  autocmd FileType html,markdown set synmaxcol=250
  autocmd BufRead,BufNewFile,BufReadPre *.txt set filetype=markdown
  autocmd BufRead,BufNewFile,BufReadPre *.jsx set filetype=javascript.jsx
  autocmd BufRead,BufNewFile,BufReadPre *.es set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.es6 set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.ejs set filetype=html
  autocmd BufRead,BufNewFile,BufReadPre *.scss set filetype=scss
  autocmd BufRead,BufNewFile,BufReadPre *.toml set filetype=toml
augroup END

set regexpengine=1
set ttyfast
set lazyredraw

"--------------------------------------------------
""" Settings key-bind.

""" Highlight cancellation by pressing Esc twice.
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

""" change tabsize.
map <F9> <C-w>10<
map <F10> <C-w>10>

""" change tabsize.
map <F11> :ToggleFullScreen<CR>

""" Settings For Search and Replace.
nnoremap / /\v
nnoremap <C-g> :vimgrep **/* \| cw
nnoremap <C-g>g :vimgrep /^.*js\-.*js.*$/ **/*.js | cw
nnoremap <C-g>f :/\( \\| \)
nnoremap <C-h> :%s;;;gc
nnoremap <Leader>z /\zs\ze.*

" Grep.
autocmd QuickFixCmdPost *grep* cwindow

""" Open new tab.
nnoremap <Leader>t :tabnew<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

""" move cursor line.
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
vnoremap <C-h> ^
vnoremap <C-l> g_

inoremap <C-j> <ESC>10ja
inoremap <C-k> <ESC>10ka
inoremap <C-h> <ESC>10ha
inoremap <C-l> <ESC>10la

""" Not register overwrite.
xnoremap s "_s
nnoremap dd "_dd

""" Add Line.
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

inoremap jj <Esc>

""" Checkout IME-mode.
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

nnoremap <silent><expr> * v:count ? '*'
\ : ':sil exe "keepj norm! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'

" vnoremap < <gv
" vnoremap > >gv

"--------------------------------------------------
""" Grep Settings.
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen

""" ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
command! -nargs=* -complete=file Rg :tabnew | :silent grep --sort-files <args>
command! -nargs=* -complete=file Rgg :tabnew | :silent grep <args>

"--------------------------------------------------
""" Settings For Terminal.

""" Instantly insert mode.
if has('nvim')
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
  autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
endif

""" Paste register.
if has('nvim')
  tnoremap <expr> <A-v> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

"--------------------------------------------------
""" Settings For PHP.

""" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

""" $VIMRUNTIME/syntax/sql.vim
let g:sql_type_default = 'mysql' " For MySQL

"--------------------------------------------------
""" Settings For HTML.

augroup AutoCmdHtml
  autocmd!
  " Append br tag.
  autocmd FileType xml,html inoremap <C-CR> <br>
  " Append close tag.
  autocmd Filetype xml,html inoremap <buffer> </ </<C-x><C-o>
augroup END

"--------------------------------------------------
""" Settings Other.

""" Vim :w Use HHKB
map ; :

set ttimeoutlen=50

nnoremap Zz :w<CR>:bd<CR>

augroup AutoCmdhighlight
  autocmd!
  autocmd Syntax sql if 1000 < line('$') | syntax sync minlines=100 | endif
  autocmd Syntax php if 1000 < line('$') | syntax sync minlines=100 | endif
augroup END

set lazyredraw
set ttyfast

""" hilight in comment.
augroup HilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|NOTE\|INFO\|XXX\|TASK\|TEMP\):')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=Red guifg=White
augroup END

""" remove new-line auto commentout.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" remove line-end space.
autocmd BufWritePre * :%s/\s\+$//ge

"--------------------------------------------------

""" Import
source $HOME/vimfiles/startify.vim
source $HOME/vimfiles/coc.vim
source $HOME/vimfiles/coc-explorer.vim
source $HOME/vimfiles/js_file_open.vim
source $HOME/vimfiles/vimrc-auto-cursorline.vim

nnoremap <F12> :edit $MYVIMRC<CR>

