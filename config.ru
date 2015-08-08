require './lib/bats.rb'
require 'json'

class App < Bats
  get '/' do
    s( 200 ).b 'Flap flap flap'
  end
  
  # Redirect back to '/'
  get '/redirect' do
  	redirect '/', false
  end
  
  get '/data' do
  	s( 200 ).h("content-type" => 'application/json').b({:test => "test"}.to_json)
  end
  
  # On all other paths show a 404 error page with the body 'Page not found!'
  get /\/.*/ do
  	s( 404 ).b 'Page not found!'
  end
end

run App