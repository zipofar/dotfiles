alias g='git'
alias gacim='git add -A && git commit -m'
alias gcim='git commit -m'
alias dc='docker-compose'
alias dcrun='docker-compose run --rm'
alias ll='ls -laF'
alias la='ls -A'
alias l='ls -CF'
alias dc='docker-compose'

set -o vi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
