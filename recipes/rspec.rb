remove_dir 'test'
run 'bundle exec rails g rspec:install'

copy_file 'rspec', '.rspec'

run 'bundle exec guard init rspec'
gsub_file 'Guardfile', /guard :rspec, cmd: "bundle exec rspec"/, 'guard :rspec, cmd: "spring rspec"'
gsub_file 'Guardfile', /rspec.spec.call\("acceptance\/#\{m\[1\]}"\)/, '\0' + ",\n      " + 'rspec.spec.call("requests/#{m[1]}")'

copy_file 'spec/spec_helper.rb'
copy_file 'spec/rails_helper.rb'
copy_file 'spec/support/request_helper.rb'
