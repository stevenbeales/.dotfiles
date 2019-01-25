
# ruby shortcuts
alias b="bundle"
alias be="bundle exec"
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"
alias gi="gem install"
alias giv="gem install -v"