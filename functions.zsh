 #f5# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
accessed () {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}

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

#f5# Backup \kbd{file_or_folder {\rm to} file_or_folder\_timestamp}
bk () {
    emulate -L zsh
    local current_date=$(date -u "+%Y%m%dT%H%M%SZ")
    local clean keep move verbose result all to_bk
    setopt extended_glob
    keep=1
    while getopts ":hacmrv" opt; do
        case $opt in
            a) (( all++ ));;
            c) unset move clean && (( ++keep ));;
            m) unset keep clean && (( ++move ));;
            r) unset move keep && (( ++clean ));;
            v) verbose="-v";;
            h) <<__EOF0__
bk [-hcmv] FILE [FILE ...]
bk -r [-av] [FILE [FILE ...]]
Backup a file or folder in place and append the timestamp
Remove backups of a file or folder, or all backups in the current directory

Usage:
-h    Display this help text
-c    Keep the file/folder as is, create a copy backup using cp(1) (default)
-m    Move the file/folder, using mv(1)
-r    Remove backups of the specified file or directory, using rm(1). If none
      is provided, remove all backups in the current directory.
-a    Remove all (even hidden) backups.
-v    Verbose

The -c, -r and -m options are mutually exclusive. If specified at the same time,
the last one is used.

The return code is the sum of all cp/mv/rm return codes.
__EOF0__
return 0;;
            \?) bk -h >&2; return 1;;
        esac
    done
    shift "$((OPTIND-1))"
    if (( keep > 0 )); then
					for to_bk in "$@"; do
							cp $verbose -pR "${to_bk%/}" "${to_bk%/}_$current_date"
							(( result += $? ))
					done
		elif (( move > 0 )); then
        while (( $# > 0 )); do
            mv $verbose "${1%/}" "${1%/}_$current_date"
            (( result += $? ))
            shift
        done
    elif (( clean > 0 )); then
        if (( $# > 0 )); then
            for to_bk in "$@"; do
                rm $verbose -rf "${to_bk%/}"_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z
                (( result += $? ))
            done
        else
            if (( all > 0 )); then
                rm $verbose -rf *_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z(D)
            else
                rm $verbose -rf *_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z
            fi
            (( result += $? ))
        fi
    fi
    return $result
}

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

#f5# Create temporary directory and \kbd{cd} to it
cdt () {
    builtin cd "$(mktemp -d)"
    builtin pwd
}

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}


#f5# List files which have been changed within the last {\it n} days, {\it n} defaults to 1
changed () {
    emulate -L zsh
    print -l -- *(c-${1:-1})
}

cx () { 
	chmod +x $* 
}

dict() {
  grep "$@" /usr/share/dict/words
}

dirsize() {
	if [ -z $1 ]; then
		dir="."
	else
		dir=$1
	fi
	find $dir -type d -maxdepth 1 -mindepth 1 -exec du -sh '{}' \; 2>/dev/null \
	| perl -pe "s/\t.*\/(.*)$/\t$(echo '\033[01;32m')\1$(echo '\033[0m')/gi" 
	echo
	echo "Total: " $(du -sh $dir 2>/dev/null | awk '{print $1}')
}

extract () {
	if [ -f $1 ] ; then
			case $1 in
					*.tar.bz2)        tar xjf $1        ;;
					*.tar.gz)         tar xzf $1        ;;
					*.bz2)            bunzip2 $1        ;;
					*.rar)            unrar x $1        ;;
					*.gz)             gunzip $1         ;;
					*.tar)            tar xf $1         ;;
					*.tbz2)           tar xjf $1        ;;
					*.tgz)            tar xzf $1        ;;
					*.zip)            unzip $1          ;;
					*.Z)              uncompress $1     ;;
					*.7z)             7zr e $1          ;;
					*)                echo "'$1' cannot be extracted via extract()" ;;
			esac
	else
			echo "'$1' is not a valid file"
	fi
}

f() { find . -iname "*$1*" ${@:2} }

fixperms(){
    find . \( -name "*.sh" -or -type d \) -exec chmod 755 {} \; && find . -type f ! -name "*.sh" -exec chmod 644 {} \;
}

funlist() {
  print -l ${(ok)functions}
}

# Determine size of a file or total size of a directory
fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

getlinks () { 
	perl -ne 'while ( m/"((www|ftp|http):\/\/.*?)"/gic ) { print $1, "\n"; }' $* 
}

gif2png() {
	if [[ $# = 0 ]]
	then
		echo "Usage: $0 foo.gif"
		echo "Purpose: change a GIF file to a PNG file"
	else
		output=`basename $1 .gif`.png
		convert  $1 $output
		touch -r $1 $output
		ls -l $1 $output
	fi
}

# Compare original and gzipped file size
gz() {
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

#f1# Provides useful information on globbing
H-Glob () {
	echo -e "
	/      directories
	.      plain files
	@      symbolic links
	=      sockets
	p      named pipes (FIFOs)
	*      executable plain files (0100)
	%      device files (character or block special)
	%b     block special files
	%c     character special files
	r      owner-readable files (0400)
	w      owner-writable files (0200)
	x      owner-executable files (0100)
	A      group-readable files (0040)
	I      group-writable files (0020)
	E      group-executable files (0010)
	R      world-readable files (0004)
	W      world-writable files (0002)
	X      world-executable files (0001)
	s      setuid files (04000)
	S      setgid files (02000)
	t      files with the sticky bit (01000)

  print *(m-1)          # Files modified up to a day ago
  print *(a1)           # Files accessed a day ago
  print *(@)            # Just symlinks
  print *(Lk+50)        # Files bigger than 50 kilobytes
  print *(Lk-50)        # Files smaller than 50 kilobytes
  print **/*.c          # All *.c files recursively starting in \$PWD
  print **/*.c~file.c   # Same as above, but excluding 'file.c'
  print (foo|bar).*     # Files starting with 'foo' or 'bar'
  print *~*.*           # All Files that do not contain a dot
  chmod 644 *(.^x)      # make all plain non-executable files publically readable
  print -l *(.c|.h)     # Lists *.c and *.h
  print **/*(g:users:)  # Recursively match all files that are owned by group 'users'
  echo /proc/*/cwd(:h:t:s/self//) # Analogous to >ps ax | awk '{print $1}'<"
}
alias help-zshglob=H-Glob

histgrep () { 
	fc -fl -m "*(#i)$1*" 1 | grep -i --color $1 
}

killProcessByName() {
  ps axf | grep $1 | grep -v grep | awk '{print "kill -9 " $1}' | sh
}

#f5# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
modified () {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

# direct it all to /dev/null
nullify() {
  "$@" >/dev/null 2>&1
}

## History wrapper
omz_history () {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# list orphan/unused brew packages so that they can be removed
orphans () {
  brew list -1 | while read cask;
  do
    echo -ne "\x1B[1;34m $cask \x1B[0m";
    brew uses $cask --installed | awk '{printf(" %s ", $0)}';
    echo "";
  done
}

plocale() {
	print LC_ALL=$LC_ALL
	print LANG=$LANG
	print LC_CTYPE=$LC_CTYPE
	print LC_NUMERIC=$LC_NUMERIC
	print LC_TIME=$LC_TIME
	print LC_COLLATE=$LC_COLLATE
	print LC_MONETARY=$LC_MONETARY
	print LC_MESSAGES=$LC_MESSAGES
	print LC_PAPER=$LC_PAPER
	print LC_NAME=$LC_NAME
	print LC_ADDRESS=$LC_ADDRESS
	print LC_TELEPHONE=$LC_TELEPHONE
	print LC_MEASUREMENT=$LC_MEASUREMENT
	print LC_IDENTIFICATION=$LC_IDENTIFICATION
}

prepend() { 
	[ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ;
}

# zsh profiling
profile () {
    ZSH_PROFILE_RC=1 zsh "$@"
}

psgrep() {
	if [ ! -z $1 ] ; then
			echo "Grepping for processes matching $1..."
			ps aux | grep $1 | grep -v grep
	else
			echo "!! Need name to grep for"
	fi
}

r() { grep "$1" ${@:2} -R . }

search() {
	if [[ ! -n "$1" ]] ; then
					echo "Usage: search \"pattern\" \"*.filemask\" \"path\""
					return
	fi

	# Did we get path arg
	if [[ ! -n "$3" ]] ;
	then
					search_path="."
	else
					search_path="$3"
	fi

	# LC_CTYPE="posix" 20x increases performance for ASCII search
	# https://twitter.com/jlaurila/status/86750682094374912

	# We use specially tuned GREP colors - make sure you have GNU grep on OSX
	# https://github.com/miohtama/ztanesh/blob/master/README.rst

	GREP_COLORS="ms=01;37:mc=01;37:sl=:cx=01;30:fn=35:ln=32:bn=32:se=36" LC_CTYPE=POSIX \
	grep -Ri "$1" --line-number --before-context=3 --after-context=3 --color=always --include="$2" --exclude=".*" "$search_path"/*
}

setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility

showoptions() {                                                                                                                                                                                                     
  local k                                                                                                                                                                                                           
  zmodload -i zsh/parameter                                                                                                                                                                                         
                                                                                                                                                                                                                    
  for k in ${(ok)options}; do                                                                                                                                                                                       
    printf "%-20s\t%s\n" $k ${options[$k]}                                                                                                                                                                          
  done                                                                                                                                                                                                              
}

src() {
	autoload -U zrecompile
	[ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
	[ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
	[ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
	[ -f ~/.zshrc.zwc.old ] && command rm -f ~/.zshrc.zwc.old
	[ -f ~/.zcompdump.zwc.old ] && command rm -f ~/.zcompdump.zwc.old
	source "$ZDOTDIR/.zshrc"
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
	);

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

up() {
  if [[ "$#" < 1 ]] ; then
      cd ..
  else
      CDSTR=""
      for i in {1..$1} ; do
          CDSTR="../$CDSTR"
      done
      cd $CDSTR
  fi
}

# Check if we can read given files and source those we can.
xsource () {
    if (( ${#argv} < 1 )) ; then
        printf 'usage: xsource FILE(s)...\n' >&2
        return 1
    fi

    while (( ${#argv} > 0 )) ; do
        [[ -r "$1" ]] && source "$1"
        shift
    done
    return 0
}

# Make it easier to search ZSH documentation
zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}

_is_command () {
	which "$1" 2>&1 > /dev/null
	return $?
}

_alias_if_not_exists() {
  ! _is_command "$1" && alias "$1"="$2"
}

