require 'spec_helper'

describe 'assets' do
  
  # /assets/source_maps/app/assets/javascripts/coffee_script_file.coffee
  # /assets/source_maps/app/assets/javascripts/coffee_script_file.map
  puts "running tests"
  it 'compiles CoffeeScript with source map comment' do
    get '/assets/coffee_script_file.js'
    response.body.should =~ /square = function\(x\) \{/
    response.body.should =~ %r!//# sourceMappingURL=/assets/source_maps/app/assets/javascripts/coffee_script_file.map!
  end

  it 'generates CoffeeScript source file' do
    get '/assets/source_maps/app/assets/javascripts/coffee_script_file.coffee'
    response.body.should =~ /square = \(x\) -> x \* x/
  end
  it 'generates CoffeeScript source map file' do
    get '/assets/source_maps/app/assets/javascripts/coffee_script_file.map'
    response.body.should =~ %r!/assets/source_maps/app/assets/javascripts/coffee_script_file.coffee!
    response.body.should =~ %r!"mappings":!
  end
end
