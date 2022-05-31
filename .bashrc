#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias off='shutdown now'

export PS1="\[\033[38;5;240m\][\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;32m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;239m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;33m\]>>>\[$(tput sgr0)\] \[$(tput sgr0)\]"
