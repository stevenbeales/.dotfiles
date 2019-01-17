
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

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

for config_file ($DZSH/.*.zsh) source $config_file

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH:"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

cd $HOME