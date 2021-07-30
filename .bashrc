#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
alias ran='ranger'
alias dragon='dragon-drag-and-drop'
alias vifm='vifmrun'
alias f='fff'
PS1='\u@[\W]\$ '

export VISUAL=nvim;
export EDITOR=nvim;
source "$HOME/.cargo/env"
source <(kitty + complete setup bash)
source /usr/share/bash-completion/completions/git

LANG="en_IN.utf8"
export LANG

export VIMRUNTIME=/usr/share/vim/vim82
export VIMRUNTIMEDIR=/usr/share/vim/vim82

