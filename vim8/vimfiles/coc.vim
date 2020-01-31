" Coc.vim

" CocList
nmap <silent> <leader><leader> :<C-u>CocList<CR>

" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for format selected region
nmap <silent> <leader>fmt <Plug>(coc-format)
vmap <leader>f <Plug>(coc-format-selected)

augroup cocgroup_init
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" diagnostics.
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

"スペースhでHover
nmap <silent> <leader>h :<C-u>call CocAction('doHover')<CR>

"スペースdfでDefinition
nmap <silent> <leader>df <Plug>(coc-definition)

"スペースrfでReferences
nmap <silent> <leader>rf <Plug>(coc-references)

"スペースrnでRename
nmap <silent> <leader>rn <Plug>(coc-rename)

" snippet.
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

