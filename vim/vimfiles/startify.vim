" startify
let g:startify_files_number = 3
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

let g:startify_bookmarks = [
  \ "~/",
  \ "~/yama-dev/",
  \ "~/yama-dev/work/",
  \ "~/yama-dev/work/task.txt",
  \ "~/.zprezto/runcoms/zprofile",
  \ "~/.vimrc",
  \ "~/.gvimrc",
  \ "~/.vim/coc-settings.json",
  \ "~/vimfiles/",
  \ "~/vimfiles/plugins.toml",
  \ "~/vimfiles/plugins_lazy.toml",
  \ ]

" ASCII ARTを真ん中寄せする
" :h startifyを参照
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines),
    \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = [
  \'',
  \ '                                              _ ',
  \ '  _   _   __ _  _ __ ___    __ _  ______   __| |  ___ __   __ ',
  \ ' | | | | / _| || |_ | _ \  / _| ||______| / _| | / _ \\ \ / / ',
  \ ' | |_| || (_| || | | | | || (_| |        | (_| ||  __/ \ V / ',
  \ '  \__, | \__,_||_| |_| |_| \__,_|         \__,_| \___|  \_/ ',
  \ '   __/ | ',
  \ '  |___/',
  \'',
  \ ]

