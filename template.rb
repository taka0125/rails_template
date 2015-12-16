require 'pathname'

@app_name = ENV['APP_NAME'] || 'webapp'
@ruby_version = ENV['RUBY_VERSION'] || RUBY_VERSION

@root_dir = Pathname.new(File.dirname(__FILE__))
@recipes_dir = @root_dir.join('recipes')

def source_paths
  [File.expand_path(File.dirname(__FILE__) + '/templates')]
end

def apply_recipe(path)
  file = @recipes_dir.join(path)
  raise "#{path} not found." unless file.exist?
  apply file.to_s
end

apply_recipe 'gem.rb'
apply_recipe 'git.rb'
apply_recipe 'readme.rb'
apply_recipe 'pattern/services.rb'
apply_recipe 'pattern/forms.rb'
apply_recipe 'application.rb'
apply_recipe 'locale.rb'
apply_recipe 'direnv.rb'
apply_recipe 'assets.rb'
apply_recipe 'unicorn.rb'
apply_recipe 'initializers.rb'

run_bundle

apply_recipe 'rspec.rb'
apply_recipe 'ridgepole.rb'

# 最後にしないとbundle execがフリーズする時がある
apply_recipe 'spring.rb'

# git :init
# git add: '.'
# git commit: %Q( -m 'Initial commit' )
