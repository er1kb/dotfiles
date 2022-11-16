#! /bin/sh
alias jlab="jupyter lab --port=8899"
alias bat="batcat"
alias bottom="btm"
alias vim="nvim"
# alias vimrc="vim ~/.vimrc"
alias vimrc="cd ~/.config/nvim/lua/erik/"
alias bashrc="vim ~/.bashrc"
alias aliases="vim ~/.bash_aliases"
alias cd="z"
alias home="cd ~/"
alias ..="cd .."
alias mv='mv -i'
# alias rm='rm -i'
alias cp='cp -i'
alias capsoff="setxkbmap -option ctrl:nocaps"
alias capson="setxkbmap -option"
alias ls="exa -lh"
alias grep="rg -i"
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
alias psql="psql -U postgres -W -h localhost"
alias pg="sudo -u postgres /etc/init.d/postgresql"
alias showkey="stdbuf -o0 showkey -a"
alias showkey_="stdbuf -o0 showkey -a | cat -"
alias venvinit="python3 -m venv venv & source venv/bin/activate & pip3 install --upgrade pip & pip3 install -r requirements.txt"
alias venv="source venv/bin/activate"
alias f="fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'"
alias unpack=extractAllTypeFiles 
alias users="source '$HOME/.config/bash_scripts/listusers.bash'"
alias sudoers="grep '^sudo:.*$' /etc/group | cut -d: -f4"
alias encoding="file -bi"
alias du="dust"
alias install_torch="ltt install --pytorch-computation-backend=cu116 --pytorch-channel=nightly torch"
alias colors="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | bash"
alias colours=colors
fgkdb () {
    vdsql postgres://$FGKDB_UN:$FGKDB_PW@$FGKDB_URL/fgkdb --postgres-schema=$1
}
kd () {
    vdsql postgres://$KD_UN:$KD_PW@$KD_URL/kundservice --postgres-schema=$1
}

