application do
<<'FILE'

    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc
    config.encoding = 'utf-8'
    I18n.enforce_available_locales = true
    config.i18n.default_locale = :ja

    config.autoload_paths << "#{Rails.root}/lib"
FILE
end
