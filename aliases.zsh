# Shortcuts
alias aliases=alias
alias c='clear'
alias chm='chmod'
alias conns="netstat -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c"
alias convertCRLF='find ./ -type f -print0 | xargs -0 dos2unix --'
alias cpi="cp -i"
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias cs='clear;ls'
alias ct="ctags -R --exclude=.git --exclude=node_modules"
alias d='dirs -v | head -10'
alias diffdirs='diff -urp'
alias e='code .'
alias excuse="telnet towel.blinkenlights.nl 666"
# file extensions in local folder
alias ext="find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u"
alias ff="find . -iname"
alias generate_secret="openssl rand -base64 32"
# Download file and save it with filename of remote file
alias get="curl -O -L"
alias headerc='curl -I --compress'
alias hg="history | grep"
alias hosts='sudo code /etc/hosts'
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias j='autojump'
alias k='kill'
# top 10 largest files in folder 
alias largefiles='du -s * | sort -n | tail'
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
alias printers='lpstat -p'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias q='exit'
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias removeempty="find . -type d -empty -delete"
alias sha1='openssl sha1'
alias size="du -h"
alias t='time'
alias tlf="tail -f"
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
# A less noisy tree list
alias tre="tree -I 'node_modules|.git|test|.DS_Store' --noreport -C -a --dirsfirst"
# Get week number
alias truncate="cp /dev/null"
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

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

  #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi