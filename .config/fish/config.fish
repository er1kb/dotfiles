if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -e fish_user_paths
# set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting             # Supresses fish's intro message
set TERM "xterm-256color"     # Sets the terminal type
set EDITOR "vim"              # $EDITOR use Emacs in terminal
set VISUAL "vim"              # $VISUAL use Emacs in GUI mode

set fish_key_bindings fish_user_key_bindings


### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

