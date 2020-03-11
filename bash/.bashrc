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

alias 'curl_header=curl -D - -s -o /dev/null'

# grep
alias grepa='grep --color=auto -r --exclude-dir={node_modules,.git} --line-number --with-filename'
alias grepl='grep --color=auto -r -l --exclude-dir={node_modules,.git} --line-number --with-filename'
alias grepc='grep --count --color=auto -r --exclude-dir={node_modules,.git} --line-number --with-filename'

# find
function finda(){
  find ./ -type d \( -name 'node_modules' -o -name '.git' \) -prune -o -type f -name $1 -print
}

##########
# For Windows.
##########

# open
alias open="explorer"

# ping
function wincmd() {
  CMD=$1
  shift
  $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias ping='wincmd ping'

