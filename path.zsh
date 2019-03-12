# Prepend $PATH without duplicates
_prepend_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$1:$PATH"
	fi
}

_append_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$PATH:$1"
	fi
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

path_remove() {
    PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' |sed 's/:$//')
}


_prepend_path '/usr/local/bin' 
_prepend_path "/usr/local/sbin"

# Load Node global installed binaries
_prepend_path "$HOME/.node/bin"

 _append_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

_prepend_path "$HOME/bin"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
_prepend_path "./bin"
_prepend_path "./node_modules/.bin"
_prepend_path "/usr/local/heroku/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
_prepend_path "$HOME/.rvm/bin"

export PATH