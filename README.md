```
$ mkdir sample
$ cd sample
$ bundle init
$ vim Gemfile
source "https://rubygems.org"

gem "rails", "5.0.0.1"

$ bundle install --path=vendor/bundle --binstubs=.bundle/bin
$ APP_NAME=sample bundle exec rails new . -d mysql -T --force -m path/to/template.rb
```

