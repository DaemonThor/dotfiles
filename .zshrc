# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/kopshoff/.zshrc'

autoload -Uz compinit
autoload -Uz promptinit
compinit
promptinit

# Set prompt to walters
prompt walters

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install

[ -f ${HOME}/.zsh/zsh_paths ] && source ${HOME}/.zsh/zsh_paths
[ -f ${HOME}/.zsh/zsh_aliases ] && source ${HOME}/.zsh/zsh_aliases
[ -f ${HOME}/.zsh/zsh_locales ] && source ${HOME}/.zsh/zsh_locales

# autostart tmux
case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.fzf.local
