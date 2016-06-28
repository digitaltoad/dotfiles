# Path to your oh-my-zsh configuration.
export ZSH_CUSTOM="$HOME/.zsh_custom"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_TMUX_AUTOSTART=true
export ZSH_THEME="digitaltoad"
export EDITOR="vi"
export ARCHFLAGS='-arch x86_64'

plugins=(tmux vi-mode brew npm mix-fast rake-fast rails rvm ssh-agent projects)

# Uncomment following line if you want to disable colors in ls
export DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.nodenv/shims:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export GOPATH="$HOME/.go"

# Maven
export MAVEN_OPTS="-Xmx512m"

# PSQL
export PGDATA="/usr/local/var/postgres"
export PGDATABASE="postgres"

# RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# NVIM
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
