require './lib/bats.rb'

class App < Bats
  get '/' do
    s( 200 ).b 'Flap flap flap'
  end
end

run App