
ENV["RAILS_ENV"] = "test"

require 'rails'
require 'coffee-rails'
require 'bundler'
Bundler.require(:default, :test)

require 'ember_script-rails'
require 'coffee-rails-source-maps'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')

require File.expand_path("../support/dummy_app/config/environment.rb",  __FILE__)

maps_path = File.expand_path("../support/dummy_app/public/assets/source_maps/app/assets/javascripts", __FILE__)

def unlink_file root, filename
  file = File.join(root, filename)
  File.unlink(file) if File.exists?(file)
end

unlink_file maps_path, 'coffee_script_file.coffee'
unlink_file maps_path, 'coffee_script_file.map'
unlink_file maps_path, 'ember_script_file.em'
unlink_file maps_path, 'ember_script_file.map'

# require 'rspec/rails'

require 'rspec/core'

RSpec::configure do |c|
  c.backtrace_exclusion_patterns << /vendor\//
  c.backtrace_exclusion_patterns << /lib\/rspec\/rails/
end

# Extensions break w/ rails edge
#require 'rspec/rails/extensions'
require 'rspec/rails/view_rendering'
require 'rspec/rails/adapters'
require 'rspec/rails/matchers'
require 'rspec/rails/fixture_support'
require 'rspec/rails/mocks'
require 'rspec/rails/module_inclusion'
require 'rspec/rails/example'
require 'rspec/rails/vendor/capybara'
require 'rspec/rails/vendor/webrat'
