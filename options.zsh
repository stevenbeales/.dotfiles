
# Don't overwrite, append history
setopt APPEND_HISTORY

# Automatically enter directories without cd
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Allow cding to variables that hold directory names
setopt CDABLE_VARS

# Prevents aliases on the command line from being internally substituted before completion is attempted
setopt COMPLETE_ALIASES

# Autocomplete not just at the end
setopt COMPLETE_IN_WORD

# Cause the oldest history event that has a duplicate to be lost 
setopt HIST_EXPIRE_DUPS_FIRST

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation
setopt EXTENDED_GLOB

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

# Whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt HASH_LIST_ALL

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE

# Remove the history (fc -l) command from the history list when invoked
setopt HIST_NO_STORE

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# do not display duplicates of a line previously found
setopt HIST_FIND_NO_DUPS

# allow quotes on command line
setopt INTERACTIVECOMMENTS

# display PID when suspending processes as well
setopt LONG_LIST_JOBS

# Perform implicit tees or cats when multiple redirections are attempted 
setopt MULTIOS

# use zsh style word splitting
setopt NO_SH_WORD_SPLIT

# report the status of backgrounds jobs immediately
setopt NOTIFY

# If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically.
setopt NUMERIC_GLOB_SORT

# expand functions in the prompt
setopt PROMPT_SUBST

# pushd goes to $HOME
setopt PUSHD_TO_HOME

# ignore dupes on directory stack
setopt PUSHD_IGNORE_DUPS

# allow embedding single in double quotes
setopt RC_QUOTES

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# allow short loop syntax
setopt SHORT_LOOPS

# ignore trailing hanging `
setopt SUN_KEYBOARD_HACK


# Don't error out when unset parameters are used
setopt UNSET

# Automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Don't append / to directories
unsetopt autoparamslash

# Discard beeps
unsetopt beep

# do not run background jobs at lower priority
unsetopt bgnice 

# Do not overwrite files when redirecting using ">". Note that you can still override this with ">|"
unsetopt clobber

# Don't send SIGHUP to background processes when the shell exits.
unsetopt hup

# Don't autocomplete ambiguous entries
unsetopt list_ambiguous

unsetopt list_beep