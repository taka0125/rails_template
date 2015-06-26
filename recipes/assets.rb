remove_file 'app/assets/javascripts/application.js'
create_file 'app/assets/javascripts/application.js', read_file('assets/javascripts/application.js')

remove_file 'app/assets/stylesheets/application.css'
create_file 'app/assets/stylesheets/application.css', read_file('assets/stylesheets/application.css')
