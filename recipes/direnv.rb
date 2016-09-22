copy_file 'envrc', '.envrc'

run 'which direnv > /dev/null 2> /dev/null && direnv allow'
