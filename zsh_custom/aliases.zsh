#!/bin/zsh
# exa
alias ll='exa -lh'

# rubygems
alias sgi='sudo gem install'
alias sgid='sudo gem install'
alias sgiv='sudo gem install -v'
alias gi='gem install'
alias gid='gem install'
alias giv='gem install -v'

# git
alias g='git'
alias ga='git add'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gm='git commit -m'
alias gcl='git clone'
alias gp='git push'

# Redis
alias sred='/usr/local/bin/redis-server'

# Emacs
alias em='TERM=screen-24bit /usr/local/bin/emacs'

alias dup='docker-compose up'

# Laravel
alias sail='bash vendor/bin/sail'
