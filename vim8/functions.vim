
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

" Detect env mac.
command! -nargs=0 IsMac call IsMac()
let s:is_mac = has('mac')
function! IsMac()
  return s:is_mac
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

