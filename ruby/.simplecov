SimpleCov.profiles.define 'app' do
  add_group 'App', 'app'
  add_group 'Lib', 'lib'
  add_group 'Config', 'config'
  add_group 'Db', 'db'
  add_group 'Spec', 'spec'

  add_filter '/.bundle/'
  add_filter '/.vscode/'
  add_filter '/bin/'
  add_filter '/coverage/'
  add_filter '/doc/'
  add_filter '/tmp/'
  add_filter '/script/'
  add_filter '/public/'
  add_filter '/vendor/'
  add_filter '/log/'
  add_filter ['_config.yml', '.codeclimate.yml', '.env', '.gitattributes', '.gitignore', 
              '.irbrc', '.overcommit.yml', '.rdoc_options',  '.rspec', '.rubocop.yml',
              '.ruby-version', '.simplecov', '.tags', '.travis.yml', 'AUTHORS', 'CODE_OF_CONDUCT.md',
              'config.reek', 'CONTRIBUTING.md', 'Gemfile', 'Gemfile.lock', 'issue_template.md', 'LICENSE',
              'Procfile', 'Rakefile', 'README.md', 'VERSION', 'config/database.yml', 'browserslist', 
              'CODEOWNERS', 'config/locales/en.yml', 'HISTORY.md', 'SECURITY.md'
            ]
end