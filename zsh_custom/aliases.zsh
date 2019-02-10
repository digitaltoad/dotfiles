#!/bin/zsh
# rubygems
alias sgi='sudo gem install --no-rdoc --no-ri'
alias sgid='sudo gem install'
alias sgiv='sudo gem install -v'
alias gi='gem install --no-rdoc --no-ri'
alias gid='gem install'
alias giv='gem install -v'

# git
alias g='git'
alias ga='git add'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset — %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gs='git status'
alias gm='git commit -m'
alias gcl='git clone'

# Redis
alias sred='/usr/local/bin/redis-server'

# Emacs
alias em='TERM=screen-24bit /usr/local/bin/emacs'
