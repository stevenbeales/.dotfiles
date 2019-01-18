# personal aliases

# UNIX commands changed to better or safer versions
alias bc='bc -l'
alias mount='mount |column -t'
alias rm='rm -i'
alias tar='gtar'
alias top="htop"
#resume downloads
alias wget='wget -c'

alias mkdir='nocorrect noglob mkdir'

# shortcuts
alias c='clear'
alias chrome='open -a "Google Chrome"'
alias cpi="cp -i"
alias cpwd='pwd | pbcopy'
alias cs='clear;ls'
alias e='code .'
alias ff="find . -iname"
alias h='history'
alias hs='history | grep'
alias j='autojump'
alias k='kill'
alias la='ls -lah'
alias latest="ls -lt |head"
alias ll='ls -l'
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
alias size="du -h"
alias t='time'
alias tlf="tail -f"
alias x="exit"
alias zshconfig="code ~/.zshrc"


# navigation shortcuts
alias home='cd ~'
alias dtop='cd ~/Desktop'
alias dbox='cd ~/Dropbox'
alias gdrive='cd ~/Google\ Drive'
alias root='cd /'

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias pv='cd -'

# git shortcuts
alias g='git'
alias st='git status'
alias com='git commit -m'
alias clone='git clone'
alias sth='git stash'
alias lg='git log'
alias u='git add -u'
alias all='git add .'
alias gp='git push'

# python shortcuts
alias pip="python3 -m pip"
alias python='python3'
alias pythonserver='python3 -m http.server'
alias p="ipython"
alias p2="python2"
alias p3="python3"
alias pypi_submit="python setup.py register sdist bdist upload"
alias aa='source env/bin/activate'
alias aactivate='source env/bin/activate'
alias venv='python -m venv'
alias serve='python3 -m http.server'
alias pydoc='python -m pydoc'
alias pdb='python -m ipdb'
alias pytime='python -m timeit'
alias pyprof='python -m profile'
alias jcat='python -m json.tool'
alias cal='python -m calendar'
# pretty print standard input
alias pprint='python -c "import pprint, sys, ast; pprint.pprint(ast.literal_eval(sys.stdin.read()))"'
# pretty print clipboard
alias pprint_clipboard='pbpaste | pprint'
alias prp="pipenv run python"


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

# ruby shortcuts
alias b="bundle"
alias be="bundle exec"
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"
alias gi="gem install"
alias giv="gem install -v"


# Toggle hidden files in Finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'