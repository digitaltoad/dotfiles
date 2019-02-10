# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/joshuaborton/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/joshuaborton/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/joshuaborton/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/joshuaborton/.fzf/shell/key-bindings.zsh"

