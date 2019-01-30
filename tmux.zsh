
# Tmux Shortcuts
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# Tmux Functions

_is_tmux_not_running() {
  [[ -z "$TMUX" ]]
}

_is_tmux_session_list_empty() {
  [[ -z $(tmux ls) ]]
}

_ensure_tmux_is_running() {
  if _is_tmux_session_list_empty; then
    tmux new -d
  fi
}

attach_to_tmux() {
  if _is_tmux_not_running; then
    _ensure_tmux_is_running
    tmux att
  fi
}