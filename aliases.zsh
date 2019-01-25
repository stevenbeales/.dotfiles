
# UNIX commands changed to better or safer versions
alias ag='ag -f --hidden'
alias bc='bc -l'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mount='mount |column -t'
# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

alias cask='brew cask'
alias where='which'

# Enable aliases to be sudo’ed
alias sudo='sudo '
alias top="htop"
#resume downloads
alias wget='wget -c'

alias mkdir='nocorrect noglob mkdir'
alias mv="nocorrect mv"
alias cp="nocorrect cp"
alias man="nocorrect man"

# /quick-stat/
alias atime="stat -c '%X - %x - %n'"
alias mtime="stat -c '%Y - %y - %n'"
alias owner="stat -c '%U - %u - %n'"
alias group="stat -c '%G - %g - %n'"

# shortcuts
# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias c='clear'
alias chrome='open -a "Google Chrome"'
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias cpi="cp -i"
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias cpwd='pwd | pbcopy'
alias cs='clear;ls'
alias d='dirs -v | head -10'
alias e='code .'
alias ff="find . -iname"
alias h='history'
alias hosts='sudo $EDITOR /etc/hosts'
alias hs='history | grep'
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias j='autojump'
alias k='kill'
alias la='ls -lah'
alias latest="ls -lt |head"
alias ll='ls -l'
alias localip="ipconfig getifaddr en0"
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias mvi="mv -i"
alias myip='curl http://ipecho.net/plain'
alias null='/dev/null'
alias o=open
alias ohmyzsh="code ~/.oh-my-zsh"
alias p='cat'
alias path='echo -e ${PATH//:/\\n}'
alias pd='pwd'
alias q='exit'
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
alias size="du -h"
alias t='time'
alias tlf="tail -f"
# Get week number
alias week='date +%V'
alias x="exit"
alias zshconfig="code ~/.zshrc"

# navigation shortcuts
alias home='cd ~'
alias dl="cd ~/Downloads"
alias dtop='cd ~/Desktop'
alias dbox='cd ~/Dropbox'
alias gdrive='cd ~/Google\ Drive'
alias root='cd /'

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias pv='cd -'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9' 

# Shortcuts to vimrc and bashrc
alias vimrc='code ~/.dotfiles/.vimrc'
alias zshrc='code ~/.dotfiles/.zshrc'
alias loadzsh='source ~/.dotfiles/.zshrc'
alias loadsecrets='source ~/.secrets.sh'

alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias generate_secret="openssl rand -base64 32"

# Editor shortcuts
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='code'

# Ctags.
alias gentags='ctags -R .'

# Let there be color in grep!
alias grep='grep --color=auto --exclude=tags --exclude-dir=.git --exclude-dir=venv'
alias convertCRLF='find ./ -type f -print0 | xargs -0 dos2unix --'

alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

# Toggle hidden files in Finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

alias /quit=exit

# Windows/DOS still in your muscle memory
alias xcopy='cp'
alias rd='rmdir'
alias ren='mv'
alias deltree='rm -r'
alias dir='la'
alias del='rm'
alias edit='code'
alias md='mkdir'
alias more='less'
alias move='mv'

# Display processes listening to TCP/IP ports
alias openports="lsof -n -P -i4TCP|grep LISTEN"