# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nils/Storage/dotfiles/fzf/bin* ]]; then
  export PATH="$PATH:/home/nils/Storage/dotfiles/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nils/Storage/dotfiles/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nils/Storage/dotfiles/fzf/shell/key-bindings.zsh"

