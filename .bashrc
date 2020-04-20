#!/bin/bash





stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 7)\][\[$(tput setaf 0)\]\u\[$(tput setaf 9 )\]@\[$(tput setaf 7)\]\h \[$(tput setaf 7)\]\t\W\[$(tput setaf 7)\]]\[$(tput setaf 9)\]\\$ \[$(tput sgr0)\]"

#export PS1="\u@\h [\$(date +%H:%M:%S)] ~ "



[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
