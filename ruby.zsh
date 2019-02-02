
# Shorthand Ruby
alias rb="ruby"
alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'

# Bundle Shortcuts
alias b="bundle"
alias be="bundle exec"
alias bes="bundle exec rspec"
alias ber="bundle exec rake"
alias bake="bundle exec rake"

# Gem Command Shorthands
alias gi="gem install"
alias giv="gem install -v"
alias gin="gem install"
alias gun="gem uninstall"
alias gli="gem list"

# Migration Shortcuts
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"

# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'

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
