

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"
 
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="$HOME/bin:$PATH"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}"

export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH:"