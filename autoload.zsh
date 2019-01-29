autoload -Uz compinit; compinit
autoload -Uz promptinit; promptinit

# makes color constants available
autoload -U colors
colors

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Control-x-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -U edit-command-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search