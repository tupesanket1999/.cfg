#
# ~/.bashrc
#

alias lc='colorls -lA --sd'
source $(dirname $(gem which colorls))/tab_complete.sh
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/sanket/.cfg/ --work-tree=/home/sanket'
