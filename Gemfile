source "https://rubygems.org"

ruby "3.3.1"
gem "active_model_serializers"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem 'pg', '~> 1.5'
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

gem 'redis', '~> 5.2'
gem 'sidekiq', '~> 7.2', '>= 7.2.4'
gem 'sidekiq-scheduler', '~> 5.0', '>= 5.0.3'

gem 'guard'
gem 'guard-livereload', require: false


group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 6.1.0'
end

group :development do
end
