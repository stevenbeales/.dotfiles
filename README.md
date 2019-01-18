# .dotfiles
Configuration files for MacOS and zsh shell

To use install zsh and oh-myzsh and place a .zshenv file in your HOME directory contiaing these 2 lines -

export ZDOTDIR="$HOME/.dotfiles"
[[ -s "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv" 
