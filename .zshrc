
# zsh profiling
# just execute 'ZSH_PROFILE_RC=1 zsh' and run 'zprof' to get the details
if [[ $ZSH_PROFILE_RC -gt 0 ]] ; then
    zmodload zsh/zprof
fi

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  brew bundler dirhistory pip git rails rvm python 
  ruby osx vscode zsh_reload zsh-syntax-hightlighting
  colored-man-pages iterm2 zsh-autosuggestions django postgres
)

source $ZSH/oh-my-zsh.sh

 export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

for config_file ($ZDOTDIR/.*.zsh) source $config_file
for config_file ($ZDOTDIR/*.zsh) source $config_file

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="$HOME/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH:"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

attach_to_tmux