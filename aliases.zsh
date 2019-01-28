
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

# Enable aliases to be sudo’ed
alias sudo='sudo '
alias top="htop"
#resume downloads
alias wget='wget -c'

alias mkdir='nocorrect noglob mkdir'
alias mv="nocorrect mv"
alias cp="nocorrect cp"
alias man="nocorrect man"

alias cask='brew cask'
alias where='which'

# /quick-stat/
alias atime="stat -c '%X - %x - %n'"
alias mtime="stat -c '%Y - %y - %n'"
alias owner="stat -c '%U - %u - %n'"
alias group="stat -c '%G - %g - %n'"

# brew shortcuts
alias bstart="brew services start"
alias bstop="brew services stop"
alias bslist="brew services list"
alias bup="brew upgrade && brew cleanup"

# shortcuts
# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias c='clear'
alias chm='chmod'
alias chrome='open -a "Google Chrome"'
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias cpi="cp -i"
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias cpwd='pwd | pbcopy'
alias cs='clear;ls'
alias ct="ctags -R --exclude=.git --exclude=node_modules"
alias d='dirs -v | head -10'
alias dotf="cd $HOME/.dotfiles"
alias e='code .'
alias ff="find . -iname"
alias h='history'
alias h1='history 10'
alias h2='history 20'
alias hosts='sudo $EDITOR /etc/hosts'
alias hs='history | grep'
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias j='autojump'
alias k='kill'
alias la='ls -lah'
alias lad='command ls -d .*(/)'
alias lsa='command ls -a .*(.)'
alias latest="ls -lt |head"
alias ll='ls -l'
alias localip="ipconfig getifaddr en0"
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
#a2# Only show symlinks
alias lss='command ls -l *(@)'
#a2# Display only executables
alias lsx='command ls -l *(*)'
#a2# Display world-{readable,writable,executable} files
alias lsw='command ls -ld *(R,W,X.^ND/)'
#a2# Display the ten biggest files
alias lsbig="command ls -flh *(.OL[1,10])"
#a2# Only show empty directories
alias lse='command ls -d *(/^F)'
#a2# Display the ten newest files
alias lsnew="command ls -rtlh *(D.om[1,10])"
#a2# Display the ten oldest files
alias lsold="command ls -rtlh *(D.Om[1,10])"
#a2# Display the ten smallest files
alias lssmall="command ls -Srl *(.oL[1,10])"

#a2# Display the ten newest directories and ten newest .directories
alias lsnewdir="command ls -rthdl *(/om[1,10]) .*(D/om[1,10])"
#a2# Display the ten oldest directories and ten oldest .directories
alias lsolddir="command ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])"

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
# A less noisy tree list
alias tr="tree -I 'node_modules|.git|test|.DS_Store' --noreport -C -a --dirsfirst"

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
alias dir="command ls -lSrah"
alias del='rm'
alias edit='code'
alias md='mkdir'
alias more='less'
alias move='mv'

# Display processes listening to TCP/IP ports
alias openports="lsof -n -P -i4TCP|grep LISTEN"

alias :q="echo 'you are not in Vi anymore' ; echo ''"
alias :w="echo 'you are not in Vi anymore' ; echo ''"

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'