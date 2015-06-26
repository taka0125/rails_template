remove_file 'config/unicorn/production.rb'
create_file 'config/unicorn/production.rb', read_template('unicorn/production.rb.erb')

remove_file 'config.ru'
create_file 'config.ru', read_file('unicorn/config.ru.erb')
