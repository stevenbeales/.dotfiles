
## Get top process eating cpu ##
alias pscpu='ps aux | sort -nr -k 3'
alias pscpu10='ps aux | sort -nr -k 3 | head -10'
# Get top process eating memory
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'

# Functions
any () {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any <keyword>" >&2 ; return 1
    else
        ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}

killProcessByName() {
  ps axf | grep $1 | grep -v grep | awk '{print "kill -9 " $1}' | sh
}

psgrep() {
	if [ ! -z $1 ] ; then
			echo "Grepping for processes matching $1..."
			ps aux | grep $1 | grep -v grep
	else
			echo "!! Need name to grep for"
	fi
}