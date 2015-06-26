application do
<<'FILE'
config.autoload_paths << "#{Rails.root}/app/forms"
FILE
end

file 'app/forms/.gitkeep', ''
