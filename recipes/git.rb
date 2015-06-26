remove_file '.gitignore'
create_file '.gitignore', read_file('git/gitignore')

remove_file '.gitattributes'
create_file '.gitattributes', read_file('git/gitattributes')