# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jborton/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/jborton/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jborton/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jborton/.fzf/shell/key-bindings.zsh"
