    ~~~(^._.^)~~~ Bats!

A micro-framework.

Bats! implements an easy to use router on top of Rack for handling REST
requests.  This makes getting an app up and running ridiculously easy.

Bats! stays out of your way.  It doesn't ask you to use any particular
development methodology, templating framework, or other such tom-foolery.

Example usage:

# config.ru

```Ruby
    require 'bats'

    class App < Bats
      get '/' do
        s( 200 ).b 'Flap flap flap'
      end
    end
    
    run App
```

Bats! uses the meta-programming library [metaid](http://viewsourcecode.org/why/hacking/seeingMetaclassesClearly.html) by the venerable Why the Lucky Stiff.  Bats! was developed as a code experiment into dynamically bootstrapping classes with raw data via meta-programming.

Bats! exposes a number of convenient class methods for setting up your app.

## addRoute

Parameters:

1. method - string
2. path - string
3. response - block, string, or object

## get

Parameters:

1. path - string
2. response - block, string, or object

## post

Parameters:

1. path - string
2. response - block, string, or object

## put

Parameters:

1. path - string
2. response - block, string, or object

## delete

Parameters:

1. path - string
2. response - block, string, or object

## redirect

Parameters:

1. path - string
2. isTemporary - boolean

Within the `get`, `path`, `put`, and `delete` class methods you can call the status class instance method (aliased by `s`) which will return a response object.

The response object has two other instance methods for response header (aliased by `h`) and response body (aliased by `b`).

Finally, when a route is through being called the status, headers, and body of the route object will be returned to the user.

# Example

```Ruby
require 'bats'
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
```
