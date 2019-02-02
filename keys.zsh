#VIM key bindings
bindkey -v
bindkey ^F vi-cmd-mode

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Found in http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
#
# Make C-z on the command line resume vim again
foreground-vim() {
    fg %vi
}

zle -N foreground-vim
bindkey '^Z' foreground-vim

# Bind delete key to something meaningful like... deleting.
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# Use ctrl-z to go back to fg app
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

bindkey '^[[1~'   beginning-of-line
bindkey '^[[2~'   overwrite-mode
bindkey '^[[3~'   delete-char
bindkey '^[[4~'   end-of-line
bindkey '^[[5~'   up-history
bindkey '^[[6~'   down-history
bindkey '^[[7~'   beginning-of-line
bindkey '^[[8~'   end-of-line
bindkey '^[OD'    backward-word
bindkey '^[OC'    forward-word
bindkey '^[^[[D'  stack-cd-forward
bindkey '^[^[[C'  stack-cd-backward
bindkey '^[[1;3D' stack-cd-forward
bindkey '^[[1;3C' stack-cd-backward
bindkey '^[[Z'    reverse-menu-complete

function copy-region-as-kill-deactivate-mark {
  zle copy-region-as-kill
  zle set-mark-command -n -1
}

zle -N copy-region-as-kill-deactivate-mark
bindkey '^[w' copy-region-as-kill-deactivate-mark

# Select directory and open a ZSH tab completer
# http://zsh.sourceforge.net/Guide/zshguide06.html#l149
# http://www.refining-linux.org/archives/40/ZSH-Gem-5-Menu-selection/
# http://www.cs.elte.hu/zsh-manual/zsh_14.html#SEC52
#
# - space: advance to the directory and open it for the completion
# - backspace: undo the selection

zmodload zsh/complist
bindkey -M menuselect ' ' accept-and-infer-next-history
bindkey -M menuselect '^?' undo

bindkey '^X^Z' universal-argument ' ' magic-space
bindkey '^X^A' vi-find-prev-char-skip
bindkey '^Xa' _expand_alias
bindkey '^Z' accept-and-hold
bindkey -s '\M-/' \\\\
bindkey -s '\M-=' \|
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

zle -N edit-command-line
bindkey '^x^e' edit-command-line

# https://github.com/sickill/dotfiles/blob/master/.zsh.d/key-bindings.zsh
tcsh-backward-word () {
  local WORDCHARS="${WORDCHARS:s#./#}"
  zle emacs-backward-word
}
zle -N tcsh-backward-word
bindkey '\e[1;3D' tcsh-backward-word
bindkey '\e^[[D' tcsh-backward-word # tmux

tcsh-forward-word () {
  local WORDCHARS="${WORDCHARS:s#./#}"
  zle emacs-forward-word
}
zle -N tcsh-forward-word
bindkey '\e[1;3C' tcsh-forward-word
bindkey '\e^[[C' tcsh-backward-word # tmux

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#./#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^[^?" tcsh-backward-delete-word # urxvt
