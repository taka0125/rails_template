require 'pathname'
require 'erb'

@app_name = ENV['APP_NAME'] || 'webapp'
@root_dir = Pathname.new(File.dirname(__FILE__))
@recipes_dir = @root_dir.join('recipes')
@templates_dir = @root_dir.join('templates')

def read_file(path)
  File.read(@templates_dir.join(path).realpath)
end

def read_template(path)
  ERB.new(read_file(path)).result(binding)
end

def apply_recipe(path)
  file = @recipes_dir.join(path)
  raise "#{path} not found." unless file.exist?
  apply file.to_s
end

apply_recipe 'gem.rb'

run_bundle

apply_recipe 'git.rb'
apply_recipe 'readme.rb'
apply_recipe 'pattern/services.rb'
apply_recipe 'pattern/forms.rb'
apply_recipe 'application.rb'
apply_recipe 'locale.rb'
apply_recipe 'direnv.rb'
apply_recipe 'assets.rb'
apply_recipe 'rspec.rb'
apply_recipe 'unicorn.rb'
apply_recipe 'ridgepole.rb'
apply_recipe 'initializers.rb'

# 最後にしないとbundle execがフリーズする時がある
apply_recipe 'spring.rb'

# git :init
# git add: '.'
# git commit: %Q( -m 'Initial commit' )
