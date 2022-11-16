# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# set vim mode
set -o vi
bind -m vi 'j':'backward-char'
bind -m vi 'k':'history-search-forward'
bind -m vi 'l':'history-search-backward'
bind -m vi 'ö':'forward-char'
bind '"jk":vi-movement-mode'

# CAPS selects level 3 = {[]} etc.
setxkbmap -option "lv3:caps_switch"
# setxkbmap -option "lv3:ralt_switch"
# setxkbmap -option "ctrl:nocaps"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# sudo journalctl --unit kibana | tail

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custom functions (aliases that take arguments)

# print line(s) $1 from text file(s) $2
println(){
   if [ "$#" -lt 2 ]; then 
      awk -v arg1="$1" 'FNR==arg1 {print FILENAME, $0}' *.csv | column -t
   else 
      awk -v arg1="$1" 'FNR==arg1 {print FILENAME, $0}' $2 | column -t
   fi
}

# count lines in file(s)
# if no argument given, print total number of lines in each file
countln(){
if [ $# -lt 1 ]
   then
      printf "\nTotalt antal rader:\n"
      find . -name '*.csv' | xargs wc -l | cat
   else
      printf "\nUnika träffar:\n"
      grep -oci "$1" $2 | grep -v :0 | column -t -s ':' | sort -k 2 -n -r | cat
      printf "\nAntal rader:\n"
      grep -c -i "$1" $2 | column -t -s ':' | sort -k 2 -n -r | cat
   fi
}

lsr(){
for d in */; do
    ls $d
done
}

extractAllTypeFiles(){ 
      if [ -f $1 ] ; then 
      case $1 in 
         *.tar.bz2)   tar xvjf $1    ;; 
         *.tar.gz)    tar xvzf $1    ;; 
         *.bz2)       bunzip2 $1     ;; 
         *.rar)       unrar x $1       ;; 
         *.gz)        gunzip $1      ;; 
         *.tar)       tar xvf $1     ;; 
         *.tbz2)      tar xvjf $1    ;; 
         *.tgz)       tar xvzf $1    ;; 
         *.zip)       unzip $1       ;; 
         *.Z)         uncompress $1  ;; 
         *.7z)        7z x $1        ;; 
         *)           echo "don't know how to extract '$1'..." ;; 
      esac 
      else 
      echo "'$1' is not a valid file!" 
   fi 
} 

alias config='/usr/bin/git --git-dir=/home/erik/.dotfiles --work-tree=$HOME'
alias vd-plugins='/usr/bin/git --git-dir=/home/erik/.visidata --work-tree=$HOME/.visidata'
alias lgconfig='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias lg='lazygit'

config config --local status.showUntrackedFiles no 

# remap fzf up/down
export FZF_DEFAULT_OPTS='--bind ctrl-k:down,ctrl-l:up,ctrl-j:'

# export PATH="/home/erik/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export EDITOR=/usr/bin/vim

export TORCH_CUDA_ARCH_LIST="8.6"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64"

source "$HOME/.config/.git_token"
source "$HOME/.secret"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
       [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
               eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(zoxide init bash)"

eval "$(starship init bash)" 

# moved to /etc/profile.d/prevent_sleep:
# xset s off && xset -dpms
