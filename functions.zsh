 #f5# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
accessed () {
    emulate -L zsh
    print -l -- *(a-${1:-1})
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

# make files executable
cx () { 
	chmod +x $* 
}

# dictionary 
dict() {
  grep "$@" /usr/share/dict/words
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

getlinks () { 
	perl -ne 'while ( m/"((www|ftp|http):\/\/.*?)"/gic ) { print $1, "\n"; }' $* 
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
help-zshglob () {
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

#f5# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
modified () {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

# direct it all to /dev/null
nullify() {
  "$@" >/dev/null 2>&1
}

over_ssh() {
    if [ -n "${SSH_CLIENT}" ]; then
        return 0
    else
        return 1
    fi
}

prepend() { 
	[ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ;
}

# zsh profiling
profile () {
    ZSH_PROFILE_RC=1 zsh "$@"
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

# CSh compatibility
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility

# setup GPG and SSH
setup_agents() {
  [[ $UID -eq 0 ]] && return

  if (( $+commands[keychain] )); then
	local -a ssh_keys gpg_keys
	for i in ~/.ssh/**/*pub; do test -f "$i(.N:r)" && ssh_keys+=("$i(.N:r)"); done
	gpg_keys=$(gpg -K --with-colons 2>/dev/null | awk -F : '$1 == "sec" { print $5 }')
    if (( $#ssh_keys > 0 )) || (( $#gpg_keys > 0 )); then
	  alias run_agents='() { $(whence -p keychain) --quiet --eval --inherit any-once --agents ssh,gpg $ssh_keys ${(f)gpg_keys} }'
	  #[[ -t ${fd:-0} || -p /dev/stdin ]] && eval `run_agents`
	  unalias run_agents
    fi
  fi
}

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

