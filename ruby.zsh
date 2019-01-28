
# ruby shortcuts
alias b="bundle"
alias be="bundle exec"
alias bes="bundle exec rspec"
alias ber="bundle exec rake"
alias bake="bundle exec rake"
alias gi="gem install"
alias giv="gem install -v"
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"
