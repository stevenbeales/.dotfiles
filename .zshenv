# sourced from ~/.zshenv

# enable colored output from ls, etc
export CLICOLOR=1

# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

export EDITOR="code -w"

export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info --color=dark,bg+:235,hl+:10,pointer:5'

export GIT_EDITOR="$EDITOR"

# Disable bundle for git-friendly
export GIT_FRIENDLY_NO_BUNDLE=true

export GIT_PS1_SHOWDIRTYSTATE=1

export GITHUB_USER="stevenbeales"

# Grep colors
export GREP_COLOR='1;33'

export HOMEBREW_NO_ANALYTICS=1

export JAVA_HOME="$(/usr/libexec/java_home)"

export LANG=en_US.UTF-8

export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'  

# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page"

export MYCODE="$HOME/code"

export PAGER=${PAGER:-less}

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export TMP="$HOME/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=90

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export ZSH_HISTORY_PATH=$HOME/.zsh_history

# CD searches this path if directory not in current tree
CDPATH=$HOME/code

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DIRSTACKSIZE=16

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Key timeout and character sequences
KEYTIMEOUT=1

# keep more history
HISTSIZE=1000

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# report about cpu-/system-/user-time of command if running longer than
# 5 seconds
REPORTTIME=5

SAVEHIST=$HISTSIZE

# watch for everyone but me and root
watch=(notme root)

WORDCHARS='*?_-[]~=./&;!#$%^(){}<>'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"
