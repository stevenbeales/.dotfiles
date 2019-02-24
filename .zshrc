
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git rails osx zsh_reload zsh-syntax-hightlighting
  colored-man-pages iterm2 zsh-autosuggestions django
  git-prompt zsh-navigation-tools 
)

source $ZSH/oh-my-zsh.sh

for config_file ($ZDOTDIR/*.zsh) source $config_file

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

 [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
