
if !&compatible
  set nocompatible
endif

" Pythonのパス
let g:python3_host_prog = fnameescape(expand('C:\Python37\python.exe'))

"--------------------------------------------------
" プラグイン関連
"--------------------------------------------------

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

" 未インストールのプラグインがある場合はインストール
if dein#check_install()
  call dein#install()
endif
