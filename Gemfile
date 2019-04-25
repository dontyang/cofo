source 'https://gems.ruby-china.com'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'rake'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'
gem 'non-stupid-digest-assets'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'redis', '~> 3.0'
gem "sidekiq"
gem "devise"
gem 'httparty'
gem 'jwt'
gem 'remotipart', '~> 1.2'
gem 'whenever'
gem 'default_where', github: 'whmall/default_where'
gem 'dalli'
gem 'kaminari'
gem 'simple_form'
gem 'enum_help'
gem 'carrierwave'
gem "roo", "~> 2.8.0"
gem "roo-xls"


group :development, :test do
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'database_cleaner'
  gem 'ruby-progressbar'
  gem 'awesome_print'
  gem 'flamegraph'
  gem 'stackprof'     # For Ruby MRI 2.1+
  gem 'fast_stack'    # For Ruby MRI 2.0
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
  gem 'mina', '1.0.6'
  gem 'mina-puma', :require => false
  gem 'mina-sidekiq'
  gem 'mina-whenever'
  gem 'falcon'
end
