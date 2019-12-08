" startify
let g:startify_files_number = 5
let g:startify_list_order = [
  \ ['-> 最近使ったファイル:'],
  \ 'files',
  \ ['-> 最近使ったファイル(カレントディレクトリ下):'],
  \ 'dir',
  \ ['-> セッション:'],
  \ 'sessions',
  \ ['-> ブックマーク:'],
  \ 'bookmarks',
  \ ]
let g:startify_bookmarks = ["~/.vimrc", "~/.gvimrc"]

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
  \'yama-dev',
  \'',
  \ ]
