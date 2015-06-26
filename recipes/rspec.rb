remove_dir 'test'
run 'bundle exec rails g rspec:install'

remove_file '.rspec'
create_file '.rspec', read_file('rspec/rspec')

run 'bundle exec guard init rspec'
gsub_file 'Guardfile', /guard :rspec do/, "guard :rspec, cmd: 'spring rspec' do"

remove_file 'spec/spec_helper.rb'
create_file 'spec/spec_helper.rb', read_file('rspec/spec_helper.rb')

remove_file 'spec/rails_helper.rb'
create_file 'spec/rails_helper.rb', read_file('rspec/rails_helper.rb')

remove_file 'spec/support/request_helper.rb'
create_file 'spec/support/request_helper.rb', read_file('rspec/support/request_helper.rb')
