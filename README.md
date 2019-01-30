# .dotfiles
Configuration files for MacOS and zsh shell

To use install zsh and oh-myzsh and place a .zshenv file in your HOME directory containing these 2 lines -

* export ZDOTDIR="$HOME/.dotfiles"
* [[ -s "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv" 

## Dependencies

* Install homebrew (At the command prompt, type
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install"`.)
 
* brew install colordiff
* brew install fzf
* brew install tmux
