
# automatically enter directories without cd
setopt AUTO_CD

setopt AUTO_PUSHD

setopt PUSHD_IGNORE_DUPS

# expand functions in the prompt
setopt PROMPT_SUBST

setopt NO_BEEP

# Don't overwrite, append!
setopt APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


unsetopt LIST_AMBIGUOUS
setopt  COMPLETE_IN_WORD

setopt EXTENDED_GLOB
