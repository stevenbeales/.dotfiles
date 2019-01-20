# .dotfiles
Configuration files for MacOS and zsh shell

To use install zsh and oh-myzsh and place a .zshenv file in your HOME directory contianing these 2 lines -

export ZDOTDIR="$HOME/.dotfiles"
[[ -s "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv" 

## Dependencies

brew install fzf
brew install zplug