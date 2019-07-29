# export TERM=xterm-24bit
# Path to your oh-my-zsh configuration.
export ZSH_CUSTOM="$HOME/.zsh_custom"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_TMUX_AUTOSTART=true
export ZSH_THEME="digitaltoad"
export EDITOR="vi"
export ARCHFLAGS='-arch x86_64'

plugins=(tmux vi-mode brew npm mix-fast rake-fast rails rvm ssh-agent projects)

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.nodenv/shims:$PATH"
export PATH="$PATH:/usr/local/opt/flutter/bin"
export PATH="$HOME/.rbenv/shims:$PATH"

### PHP 7.1 first
export PATH="/usr/local/opt/php@7.1/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export GOPATH="$HOME/.go"

# Maven
export MAVEN_OPTS="-Xmx512m"

# PSQL
export PGDATA="/usr/local/var/postgres"
export PGDATABASE="postgres"

# KIEX
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# NVIM
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# FZF
export FZF_DEFAULT_OPTS='
  --color fg:188,hl:103,fg+:222,bg+:235,hl+:104
  --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# if command -v docker-machine >/dev/null 2>&1; then
#   eval "$(docker-machine env default)"
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore dist -g ""'
