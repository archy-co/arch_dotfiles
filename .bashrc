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
