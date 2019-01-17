
#VIM key bindings
bindkey -v
bindkey ^F vi-cmd-mode

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws brew bundler copyfile dirhistory git rails rvm python 
  ruby sudo osx vscode zsh_reload zsh-syntax-hightlighting
)

# makes color constants available
autoload -U colors
colors

source $ZSH/oh-my-zsh.sh

[[ -f "$HOME/.dotfiles/.functions" ]] && source "${HOME}/.dotfiles/.functions"

[[ -f "$HOME/.dotfiles/.aliases" ]] &&   source "${HOME}/.dotfiles/.aliases"


test -e "${DSH}/.iterm2_shell_integration.zsh" && source "${DSH}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH:"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
# ignore duplicate history entries
setopt histignoredups

# automatically enter directories without cd
setopt auto_cd

# expand functions in the prompt
setopt prompt_subst


autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
# use incremental search
# bindkey ^R history-incremental-search-backward
