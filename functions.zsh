
# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

cx () { chmod +x $* }

dict() {
    grep "$@" /usr/share/dict/words
}

dirsize()
{
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

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

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

folsym() {
if [[ -e $1 || -h $1 ]]; then
	file=$1
else
	file=`which $1`
fi
if
	if [[ -e $file || -L $file ]]; then
		if [[ -L $file ]]; then
			echo `ls -ld $file | perl -ane 'print $F[7]'` '->'
			folsym `perl -le '$file = $ARGV[0];
			$dest = readlink $file;
			if ($dest !~ m{^/}) {
				$file =~ s{(/?)[^/]*$}{$1$dest};
			} else {
			$file = $dest;
		}
		$file =~ s{/{2,}}{/}g;
		while ($file =~ s{[^/]+/\.\./}{}) {
			;
		}
		$file =~ s{^(/\.\.)+}{};
		print $file' $file`
	else
		ls -d $file
	fi
else
	echo $file
fi
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


# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}

getlinks () { perl -ne 'while ( m/"((www|ftp|http):\/\/.*?)"/gic ) { print $1, "\n"; }' $* }

g() {
	emulate -LR zsh
	local p=$argv[-1]
	[[ -d $p ]] && { p=$p/; argv[-1]=(); } || p=''
	grep --exclude "*~" --exclude "*.o" --exclude "tags" \
		--exclude-dir .bzr --exclude-dir .git --exclude-dir .hg --exclude-dir .svn \
		--exclude-dir CVS --exclude-dir RCS --exclude-dir _darcs \ --exclude-dir _build \
		-r -P ${@:?regexp missing} $p
}	


gif2png() 
{
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

gitize() { git init && git add . && git commit -a -m"initial commit" && git gc } 

# Compare original and gzipped file size
gz() {
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

histgrep () { fc -fl -m "*(#i)$1*" 1 | grep -i --color $1 }

killProcessByName(){
  ps axf | grep $1 | grep -v grep | awk '{print "kill -9 " $1}' | sh
}

plocale()
{
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

prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 ;
}

psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

remove-pyc-files() {
    find . -name "*.pyc" -exec rm -rf {} \;
}

showoptions() {                                                                                                                                                                                                     
  local k                                                                                                                                                                                                           
  zmodload -i zsh/parameter                                                                                                                                                                                         
                                                                                                                                                                                                                    
  for k in ${(ok)options}; do                                                                                                                                                                                       
    printf "%-20s\t%s\n" $k ${options[$k]}                                                                                                                                                                          
  done                                                                                                                                                                                                              
}

src()
{
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


# Make it easier to search ZSH documentation
zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}

# restore previous cwd
if [[ -f ~/.last_cwd ]]; then
  cd `cat ~/.last_cwd`
fi
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )




