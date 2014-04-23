require 'spec_helper'

describe 'assets' do
  
  # /assets/source_maps/app/assets/javascripts/coffee_script_file.coffee  
  it 'compiles EmberScript assets' do
    get '/assets/ember_script_file.js'
    response.body.should =~ /Ember\.Object\.extend/
  end
  
  
end
