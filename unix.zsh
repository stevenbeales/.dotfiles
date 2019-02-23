# UNIX commands changed to better or safer versions
alias ag='ag -f --hidden'
alias bc='bc -l'
alias cp="nocorrect cp -i"
alias df='df -H'
alias diff='colordiff'
alias du='du -ch'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Let there be color in grep!
alias grep='grep --color=auto --exclude=tags --exclude-dir=.git --exclude-dir=venv'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias jobs='jobs -l'
alias man="nocorrect man"
alias mkdir='nocorrect noglob mkdir'
# make human readable
alias mount='mount |column -t'
alias mv="nocorrect mv -v"
alias ping='ping -c 5'
alias rm='rm -i -v'
# Enable aliases to be sudo’ed
alias sudo='sudo '
alias top="htop"
#resume downloads
alias wget='wget -c'
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
