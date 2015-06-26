# This file is used by Rack-based servers to start the application.

# http://qiita.com/Oakbow/items/ef88df07234866c7be30
if ENV['RAILS_ENV'] == 'production'
  require 'unicorn/worker_killer'

  max_request_min = ENV['UNICORN_MAX_REQUEST_MIN'].to_i || 3072
  max_request_max = ENV['UNICORN_MAX_REQUEST_MAX'].to_i || 4096

  oom_min = ((ENV['UNICORN_OOM_MIN'].to_i || 192) * (1024**2))
  oom_max = ((ENV['UNICORN_OOM_MAX'].to_i || 256) * (1024**2))

  use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max
  use Unicorn::WorkerKiller::Oom, oom_min, oom_max
end

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
