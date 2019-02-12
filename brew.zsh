
# Brew Shortcuts
alias cask='brew cask'
alias bstart="brew services start"
alias bstop="brew services stop"
alias bslist="brew services list"
alias bup="brew upgrade && brew cleanup"
alias bri="brew install"
alias bru="brew uninstall"
alias brc="brew cleanup"
alias brewp='brew pin'
alias brews='brew list -1'
alias brewsp='brew list --pinned'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'

# Functions

# List orphan/unused brew packages so that they can be removed
orphans () {
  brew list -1 | while read cask;
  do
    echo -ne "\x1B[1;34m $cask \x1B[0m";
    brew uses $cask --installed | awk '{printf(" %s ", $0)}';
    echo "";
  done
}
