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

## Optional

Any of these files may be removed if you do not have the following software -

macos.zsh is for macOS only
postgres.zsh is for postgres only
ruby.zsh is for ruby only
python.zsh is for python only
javascript.zsh is for javascript only
chrome.zsh is for chrome only
vagrant.zsh is for vagrant only
docker.zsh is for docker only
vscode.zsh is for vscode only
.iterm2_shell_integration.zsh is for iterm2 only
