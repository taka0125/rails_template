application do
<<'FILE'
config.autoload_paths << "#{Rails.root}/app/services"
FILE
end

file 'app/services/.gitkeep', ''