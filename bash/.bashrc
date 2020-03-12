##########
# .bashrc
##########

# linux
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# ripgrep
alias rgf='rg --files | rg'

alias 'curl_header=curl -D - -s -o /dev/null'

# grep
alias grepa='grep --color=auto -r --exclude-dir={node_modules,.git} --line-number --with-filename'
alias grepl='grep --color=auto -r -l --exclude-dir={node_modules,.git} --line-number --with-filename'
alias grepc='grep --count --color=auto -r --exclude-dir={node_modules,.git} --line-number --with-filename'

# find
function finda(){
  find ./ -type d \( -name 'node_modules' -o -name '.git' \) -prune -o -type f -name $1 -print
}

# vi
alias vi='vim -u NONE -N'

# git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gst='git status'
alias gb='git branch'
alias gba='git fetch && git branch -a'
alias gch='git checkout'
alias gc='git commit'
alias gf='git fetch'
alias gp='git push'

# dotfiles
alias dotfiles='gvim ~/'

##########
# For Mac.
##########

if [ "$(uname)" == "Darwin" ]; then

echo Mac

fi

##########
# For Linux.
##########

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
echo Linux

fi

##########
# For Windows.
##########

if [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
echo Windows

# vim
alias vim='gvim -u NONE'

# export FORCE_COLOR=true
FORCE_COLOR=true

# tree
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"

# open
alias open="explorer"

# ping
function wincmd() {
  CMD=$1
  shift
  $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias ping='wincmd ping'

