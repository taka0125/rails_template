application do
<<'FILE'

    config.active_record.schema_format = :sql
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc
    config.encoding = 'utf-8'
    I18n.enforce_available_locales = true
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    config.autoload_paths << "#{Rails.root}/lib"
    config.active_job.queue_adapter = :sidekiq
FILE
end
