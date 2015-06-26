remove_file 'lib/tasks/db.rake'
create_file 'lib/tasks/db.rake', read_file('ridgepole/db.rake')