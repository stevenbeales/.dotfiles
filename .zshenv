# sourced from ~/.zshenv

export EDITOR="code -w"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# enable colored output from ls, etc
export CLICOLOR=1

# keep more history
export HISTSIZE=1000

export HOMEBREW_NO_ANALYTICS=1

export MYCODE="$HOME/code"

export JAVA_HOME="$(/usr/libexec/java_home)"

export PAGER=${PAGER:-less}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

RED="\[\033[0;31m\]"
PINK="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
LT_GREEN="\[\033[1;32m\]"
BLUE="\[\033[0;34m\]"
WHITE="\[\033[1;37m\]"
PURPLE="\[\033[1;35m\]"
CYAN="\[\033[1;36m\]"
BROWN="\[\033[0;33m\]"
COLOR_NONE="\[\033[0m\]"

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# report about cpu-/system-/user-time of command if running longer than
# 5 seconds
REPORTTIME=5

# watch for everyone but me and root
watch=(notme root)
