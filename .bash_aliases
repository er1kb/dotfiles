#! /bin/sh
alias jlab="jupyter lab --port=8899"
alias bat="batcat"
alias bottom="btm"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias aliases="vim ~/.bash_aliases"
alias home="cd ~/"
alias ..="cd .."
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias capsoff="setxkbmap -option ctrl:nocaps"
alias capson="setxkbmap -option"
alias ls="exa"
alias grep="rg"
alias cat="bat"
alias less="bat"
alias postgres="sudo -i -u postgres" 
alias gpu="nvtop"
alias open="nautilus --browser"
alias mkdir="mkdir -pv"
alias aptup="sudo apt update && sudo apt upgrade"
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptin="sudo apt install"
alias aptrm="sudo apt remove"
alias pg="sudo -u postgres /etc/init.d/postgresql"
alias showkey="stdbuf -o0 showkey -a"
alias showkey_="stdbuf -o0 showkey -a | cat -"
alias venv="source venv/bin/activate"
