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

alias "curl_header=curl -D - -s -o /dev/null"
# grep
alias grepa='grep --color=auto -r --exclude-dir={node_modules,.git} --line-number --with-filename'
alias grepl='grep --color=auto -r -l --exclude-dir={node_modules,.git} --line-number --with-filename'
alias grepc='grep --count --color=auto -r --exclude-dir={node_modules,.git} --line-number --with-filename'


