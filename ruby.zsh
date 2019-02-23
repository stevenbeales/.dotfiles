
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

# Gem Command Shorthands
alias gi="gem install"
alias giv="gem install -v"
alias gun="gem uninstall"
alias gli="gem list"

alias irb='irb --readline -r irb/completion'

# Migration Shortcuts
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"

# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'

alias ss='script/server'
alias sr='script/run'
alias sf='script/fmt'
alias sb='script/bootstrap'
alias st='script/test'
alias sg='script/guard'
alias sb='script/bootstrap'
alias sw='script/watch'
alias sc='script/console'
alias sm='script/migrate'

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
