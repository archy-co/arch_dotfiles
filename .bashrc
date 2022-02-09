#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

LANG="en_US.utf8"
export LANG
export TERM=alacritty

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'
alias ja='java'
alias gnome-multi-writer='sudo gnome-multi-writer'
alias vifm='~/.config/vifm/scripts/vifmrun'

set show-all-if-ambiguous on
set show-all-if-unmodified on
set menu-complete-display-prefix on
bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'

for file in ${XDG_CONFIG_HOME:-$HOME/.config}/bash/{plugins,local}/*.bash; do
    source "$file"
done
unset file
export PATH="/home/archy/.local/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/jvm/default/bin"

bind '"\C-H": backward-kill-word'
bind '"\C-P": previous-history'
bind '"\C-N": next-history'

export JDTLS_HOME=~/.cache/yay/jdtls

VISUAL=nvim
EDITOR=nvim
