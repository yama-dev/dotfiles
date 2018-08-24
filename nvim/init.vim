"--------------------------------------------------
" Config.

" Python Path
let g:python3_host_prog = fnameescape(expand('C:\Python37\python.exe'))

"--------------------------------------------------
" Plugins. -> dein.vim

" Neovim設定ディレクトリ
let nvim_dir = substitute($XDG_CONFIG_HOME . '/nvim/', '\', '/', 'g')

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
let &runtimepath = substitute( dein_repo_dir , '/', '\', 'g') . "," . &runtimepath

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
set columns=110
set lines=63

" Line Number.
set number

" Command line.
set cmdheight=3
set wildmenu
set wildmode=list:longest,list:full
set wildchar=<tab>
set wildignore+=.git,.svn
set wildignore+=.DS_Store

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

" Move cursor to move
set whichwrap=b,s,h,l,<,>,[,]

" clip board
set clipboard+=unnamedplus

"--------------------------------------------------
" Settings key-bind.

" Highlight cancellation by pressing Esc twice.
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" file type setting
autocmd BufRead,BufNewFile,BufReadPre *.txt set filetype=markdown
autocmd BufRead,BufNewFile,BufReadPre *.es6 set filetype=javascript

" change tabsize.
map <F9> <C-w>10<
map <F10> <C-w>10>

" Settings For Search and Replace.
nnoremap / /\v
nnoremap <C-g> :vim  **/* \| cw
nnoremap <C-g>f :/\( \\| \)
nnoremap <C-g>js :vim  **/*.es6 \| cw
nnoremap <C-g>html :vim  **/*.html \| cw
nnoremap <C-g>css :vim  **/*.scss \| cw
nnoremap <C-h> :%s;;;gc
nnoremap <Space>z /\zs\ze.*


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
