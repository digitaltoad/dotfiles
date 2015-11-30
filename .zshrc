# Path to your oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"

export ZSH_TMUX_AUTOSTART=true

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="digitaltoad"
export EDITOR="vi"
export ARCHFLAGS='-arch x86_64'
plugins=(tmux vi-mode brew npm rails rails3 rvm ssh-agent digicustom)

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

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

# Company
export COMPANY="Egon Machine"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# NVIM
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1
