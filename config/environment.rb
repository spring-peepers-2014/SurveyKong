# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'bcrypt'
# require 'bcrypt-ruby'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

# testing
require 'rspec'
require 'rack/test'
require 'shoulda-matchers'
require 'factory_girl'
require 'faker'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # HTML only allows `post' and `get' by default
  # RESTful convention uses `put' and `delete' controller routes
  # Translates`put' and `delete' routes in Sinatra controller to
  # appropriate `post' request through in HTML
  enable :method_override
  # Use hidden field to trigger appropriate form action:
  # <form action="" method="post">
  #   <input type="hidden" name="_method" value="put" />
  #   <input type="hidden" name="_method" value="delete" />
  # </form>

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
