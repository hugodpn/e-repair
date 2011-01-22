RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem "authlogic",       :version => '2.1.6'
  config.gem "rspec",           :version => '=1.3.0',     :lib => 'spec'
  config.gem "rspec-rails",     :version => '=1.3.2',     :lib => 'spec'
  config.gem "factory_girl",    :version => '>= 1.3.2',    :lib => 'factory_girl'
  config.gem "will_paginate",   :version => '>=2.3.14'
  config.gem "fastercsv",       :version => '>=1.5.3'

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end

#require 'tls_smtp'

#Configuração para envio de e-mail
ActionMailer::Base.default_content_type = "text/html"
#ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.smtp_settings = {
#  :address => "smtp.mail.yahoo.com",
#  :port => 25,
#  :domain => "www.dhpn.com.ar",
#  :user_name => "hugodpn@yahoo.com.ar",
#  :password => "",
#  :authentication  => :login
#}


ActionMailer::Base.delivery_method = :smtp


ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => 'dhpn.com.ar',
  :authentication => :plain,
  :user_name => 'hugodpn',
  :password => ''
}