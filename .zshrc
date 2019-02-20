
# zsh profiling
# just execute 'ZSH_PROFILE_RC=1 zsh' and run 'zprof' to get the details
if [[ $ZSH_PROFILE_RC -gt 0 ]] ; then
    zmodload zsh/zprof
fi

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bundler git gitfast rails osx zsh_reload zsh-syntax-hightlighting
  colored-man-pages iterm2 zsh-autosuggestions django
  git-prompt zsh-navigation-tools 
)

source $ZSH/oh-my-zsh.sh

for config_file ($ZDOTDIR/.*.zsh) source $config_file
for config_file ($ZDOTDIR/*.zsh) source $config_file

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# if [ ! -d "${TMP}" ]; then mkdir "${TMP}"; fi

 [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Load SSH and GPG agents via keychain.
setup_agents
unfunction setup_agents