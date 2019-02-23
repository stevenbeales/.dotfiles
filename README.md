# .dotfiles
Configuration files for MacOS and zsh shell

To use install zsh and oh-my-zsh and place a .zshenv file in your HOME directory containing these 2 lines -

* export ZDOTDIR="$HOME/.dotfiles"
* [[ -s "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv" 

## Dependencies

* Install homebrew (At the command prompt, type
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install"`.)
 
* brew install zsh 

* Install oh-my-zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

* brew install autojump
* brew install colordiff
* brew install fzf
* brew install tmux

## Configuration

* Globally replace across all files - 

     Steven Beales with your FirstName LastName
     
     stevenbeales@gmail.com with your email address
     
     /users/sbeales with your home directory
     
     github.com/stevenbeales with your github URL

## Optional

Any of these files may be removed if you do not have the following software -

* .iterm2_shell_integration.zsh is for iterm2 only
* chrome.zsh is for chrome only
* docker.zsh is for docker only
* heroku.zsh is for heroku only
* javascript.zsh is for javascript only
* macos.zsh is for macOS only
* postgres.zsh is for postgres only
* python.zsh is for python only
* ruby.zsh is for ruby only
* vagrant.zsh is for vagrant only
* vscode.zsh is for vscode only
