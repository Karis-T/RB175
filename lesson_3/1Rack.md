## Rack

Rack is a generic interface library that acts as a specification for how a web server (The `TCPServer` we made or a more common, robust one such as WEBrick)  and its app talk to each other. It prescribes a set of simple, common rules so us app developers can connect to web servers.

- Your webserver (WEBrick installed with ruby) is loaded with a ruby app (Rack app) and it receives a request from a client.
- While the webserver understands what the HTTP request is, it doesn't know what to do with it so it hands it to its loaded ruby app.
- The ruby app can't fully understand the server so we use rack to translate the HTTP request into a format the ruby app can understand
- rack also shows the ruby app how to translate ruby code into a format the server understands

This is what the server should send to the app:

```ruby
# server to ruby app

env = {
  'REQUEST_METHOD' => 'GET',
  'PATH_INFO' => '/users',
  'HTTP_VERSION' => '1.1',
  'HTTP_HOST' => 'localhost',
  ...
}
```

The `env` variable is a hash containing the keys and values of the HTTP request for the application. This includes all the HTTP headers and specific rack information. It tells the server side code how to process the request.

and the app should send back to the server:

```ruby
# Rails app to server

[200,{'Content-Length' => '25','Content-Type' => 'text/html'},['<html>','...','</html>']]
```

The app returns an array containing 3 parts:

1. the HTTP status code `200`
2. A hash with `header` names and their corresponding values
3. any object containing the `body` of the resource (as long as it respond to `each`) The response should never be a `String` by itself, it must `yield` a string value

To be able to work with the `env` variable the ruby app should create a `call` instance method with `env` as its parameter:

```ruby
class App
  def call(env)
    [200, {'Content-Length' => 25, 'Content-Type' => 'text/html' }, ["<html>", "...", "</html>" ]]
  end
end
```

To use rack we also need: 

- the "rackup" is a startup server configuration file specifying to the server what  and how to run (needs a `.ru` file extension)
- The rack application
- The class used by the rackup file
- The rack application we use in the rackup file needs to be a ruby object that responds to the method `call(env)` which takes one argument: The environment variable for this application. It's return value must respond to the `each` method

### What are Rack applications?

instead of overloading your ruby app with HTTP requests from the server and having to parse a http request and send back a response that the server understands, you want your program to focus on what counts - its own app and business logic. 

This is where app servers such as WebBrick come in - they are designed to be the middle man that handles all communication between the web and your app. In order to do this both the server and app need to follow a strict set of rules to ensure they can talk to each other. These are the rules shown above (expected variables and objects) and are known as the **Rack specification.** 

While rack doesn't come with its own server, it uses the default server installed on your machine that comes with ruby (WEBrick). If you want to though you can install a custom server (Puma, Thin etc) on your machine.

Any app that conforms to these rules is considered a *Rack application*. If you open up any ruby program and it contains the `call` method with `env` passed in as an argument you'll know it works with rack.

Many ruby frameworks such as Rails and Sinatra are all rack compatible.

![Server Rack](https://da77jsbdz4r05.cloudfront.net/images/working_with_sinatra/server-zoom-rack.png)

API is short for application programming interface is a collection of programs that an application can use to access other components of the Operating system

### More about rack

- [Demystifying Ruby Applications, Ruby Application Servers, and Web Servers](https://medium.com/launch-school/demystifying-ruby-applications-ruby-application-servers-and-web-servers-c3d0fd415cb3)
- [What is ‘Rack’ in Ruby/Rails?](http://blog.gauravchande.com/what-is-rack-in-ruby-rails)

### Blog Series on Rack

- [Part 1](https://launchschool.com/blog/growing-your-own-web-framework-with-rack-part-1)
- [Part 2](https://launchschool.com/blog/growing-your-own-web-framework-with-rack-part-2)
- [Part 3](https://launchschool.com/blog/growing-your-own-web-framework-with-rack-part-3)
- [Part 4](https://launchschool.com/blog/growing-your-own-web-framework-with-rack-part-4)