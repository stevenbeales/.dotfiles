
prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ;
}

function killProcessByName(){
  ps axf | grep $1 | grep -v grep | awk '{print "kill -9 " $1}' | sh
}


# restore previous cwd
if [[ -f ~/.last_cwd ]]; then
  cd `cat ~/.last_cwd`
fi
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )


function remove-pyc-files {
    find . -name "*.pyc" -exec rm -rf {} \;
}


# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Make it easier to search ZSH documentation
zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}