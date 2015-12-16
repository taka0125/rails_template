require 'open3'

namespace :db do
  def apply(dry_run = true)
    config_file = Rails.root.join('config', 'database.yml')
    schema_file = Rails.root.join('db', 'schemas', 'Schemafile')

    options = "--apply"
    if dry_run
      options += " --dry-run"
    end

    command = "bundle exec ridgepole -c #{config_file} -f #{schema_file} --enable-mysql-awesome #{options} -E #{Rails.env}"
    puts command

    Open3.popen2e(command) do |stdin, stdout_and_stderr, _|
      stdin.close
      stdout_and_stderr.each_line do |line|
        puts line
      end
    end
  end

  task 'migrate' => :environment do
    ENV['RAILS_ENV'] ||= 'development'
    apply(false)
  end

  desc 'apply dry run'
  task :'apply-dry-run' => :environment do
    ENV['RAILS_ENV'] ||= 'development'
    apply(true)
  end
end