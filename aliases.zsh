
# Shortcuts
alias c='clear'
alias chm='chmod'
alias convertCRLF='find ./ -type f -print0 | xargs -0 dos2unix --'
alias cpi="cp -i"
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias cs='clear;ls'
alias ct="ctags -R --exclude=.git --exclude=node_modules"
alias d='dirs -v | head -10'
alias e='code .'
alias ff="find . -iname"
# File size
alias generate_secret="openssl rand -base64 32"
alias headerc='curl -I --compress'
alias hosts='sudo code /etc/hosts'
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias j='autojump'
alias k='kill'
alias localip="ipconfig getifaddr en0"
# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"
alias mvi="mv -i"
alias myip='curl http://ipecho.net/plain'
alias null='/dev/null'
alias o=open
# Display processes listening to TCP/IP ports
alias openports="lsof -n -P -i4TCP|grep LISTEN"
alias p='cat'
alias path='echo -e ${PATH//:/\\n}'
alias q='exit'
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
alias sha1='openssl sha1'
alias size="du -h"
alias t='time'
alias tlf="tail -f"
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
# A less noisy tree list
alias tr="tree -I 'node_modules|.git|test|.DS_Store' --noreport -C -a --dirsfirst"
# Get week number
alias week='date +%V'
alias where='which'
alias x="exit"
# clean terminal history
alias yolo="history -c && clear"

# Shortcuts to vimrc and zshrc
alias ohmyzsh="code ~/.oh-my-zsh"
alias vimrc='code ~/.dotfiles/.vimrc'
alias zshconfig="code ~/dotfiles/.zshrc"
alias zshrc=zshconfig

alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
# Editor shortcuts
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='code'

alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

alias /quit=exit

alias :q="echo 'you are not in Vi anymore' ; echo ''"
alias :w="echo 'you are not in Vi anymore' ; echo ''"
