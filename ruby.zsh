export RUBYOPT="rubygems"

# Shorthand Ruby
alias rb="ruby"
alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'

# Bundle Shortcuts
alias b="bundle"
alias be="bundle exec"
alias bes="bundle exec rspec"
alias ber="bundle exec rake"
alias bo='bundle open'
alias bl='bundle list'
alias bs='bundle show'
alias bx='bundle exec'

# Gem Command Shorthands
alias ge='gem open' # gem install gem-browse
alias gi="gem install"
alias giv="gem install -v"
alias gun="gem uninstall"
alias gli="gem list"

alias i='irb -rubygems'
alias irb='irb --readline -r irb/completion'

# Migration Shortcuts
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"

# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'
alias r='rake'
alias redstart='redis-server'
alias rt='rake -T'

# Rails
alias crsp='COVERAGE=true rspec .'
alias rc='rails console'
alias rcop='rubocop'
alias rdb='rails dbconsole'
alias rddd='brew services restart postgresql; sleep 15; rails db:drop'
alias rdm='rails db:migrate'
alias rgm='rails generate migration'
alias rs='rails server'
alias rsp='rspec .'
alias rsr='rails restart'
alias rtp='rails db:test:prepare'
alias sst='spring status'
alias psp='spring stop && DISABLE_SPRING=0 bin/rake parallel:spec'

# Functions

gems () {
	local current_ruby=`rvm-prompt i v p`
	local current_gemset=`rvm-prompt g`

	gem list $@ | sed -E \
		-e "s/\([0-9, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
		-e "s|$(echo $rvm_path)|$fg[magenta]\$rvm_path$reset_color|g" \
		-e "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
		-e "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
}

rvm-update () {
	rvm get head
}
