#VIM key bindings
bindkey -v
bindkey ^F vi-cmd-mode

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Bind delete key to something meaningful like... deleting.
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

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
