# General
alias so='source'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias ddate='date +"%Y-%m-%d"'
alias doco='docker-compose'
alias pweb='python -m SimpleHTTPServer'
alias online='ping -c 1 google.com &> /dev/null'
alias docker-killall="docker ps | tail -n +2 | awk '{ print \$1 }' | xargs docker kill"


# Git
alias g='git'
alias gp='git push'
alias ga='git add --all'
alias gd='git diff'
alias gl='git log'
alias gla='git log --all'
alias gt='git tree'
alias gta='git tree --all'
alias gdt='git difftool'
alias gmt='git mergetool'
alias gs='git status -sb'
alias gci='git commit -m'
alias gcm='git checkout master'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Ruby
alias be='bundle exec'
alias ra='rails'

# JS
alias yr="yarn run"
alias npr="npm run"
