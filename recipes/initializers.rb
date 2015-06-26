remove_file 'config/initializers/json.rb'
create_file 'config/initializers/json.rb', read_file('initializers/json.rb')

remove_file 'config/initializers/rails_config.rb'
create_file 'config/initializers/rails_config.rb', read_file('initializers/rails_config.rb')