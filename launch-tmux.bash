shopt -q login_shell && [[ $- == *i* ]] && [ -z "$TMUX" ] && exec tmux new -ADs auto
