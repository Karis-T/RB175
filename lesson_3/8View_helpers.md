## Helpers

- Taking a task that we could do the hard way and helping us do it much easier 
- Sinatra is very lean by design and doesn't have a lot of built-in helpers
- Helpers are meant to be added in as needed
- Some of the built in helpers are:
  - `redirect` - Sinatra will redirect the request to another request and send back the proper response
  - `send_file` - Sinatra will deliver the file to the user in the proper format without any work on the developers end
  - set the content-type
  - cache control
  - The sinatra docs will give you more info

### Define custom helper methods

```ruby
helpers do
  def method_name(parameter)
    # ....
  end
end
```

- use the helper keyword and create a code block
- write ruby definitions inside the `helpers` block
- It's written this way so that the methods are available to our routes and our templates

To reduce the amount of code place the helpers into a `helpers.rb` file and tell your Sinatra file to use that file `require_relative 'helpers'`

### using cookies

```ruby
require "sinatra/cookies"

get '/set-cookie' do
  cookies[:value] = 100 #cookie helper method
end

get '/read-cookie' do
  "The cookie value is #{cookies[:value]}"
end
```

- since Sinatra is very lean, you'll have to download the gem `sinatra-contrib` to use cookie related methods

### sessions

- use when you have more info about a user
- use when you want to keep that info private away from the users eyes
- usually a logged in state

```ruby
enable :sessions

get '/set-session' do
  session[:value] = 100
end

get '/read-session' do
  "The session value is #{session[:value]}"
end
```

- unlike cookies, sessions are already built into sinatra

- we do have to `enable :sessions` though to use them

- treat sessions like a hash

- Typically session files are stored on the server either:

  - as static files
  - or entries in a database

- each user is given a browser cookie that identifies them with their session so we know what session belongs to which user

- Sinatra is different though:

  - Sinatra stores a session in an encrypted signed cookie on the USERS BROWSER
  - Its like a super cookie with more info but the user can't read it because its encrypted. It's also been signed to prevent them from tampering with it
  - This leads to fewer session management issues
  - but it has a 4k size limit: session info needs to be kept VERY small

- Sinatra encrypts and signs cookies with a secret random string that is generated every time Sinatra starts up. 

  - This can be problematic because the secret string changes per session
  - To prevent this from happening and hang onto the same session for re-use we have to tell sinatra our own secret string that it can use everytime. That way all the sessions will be available even if sinatra is restarted

  ```ruby
  enable :sessions
  set :session_secret, '53I6P3U5HGI34GHRIGIHHR243598GWEF09'
  ```

- you don't have to use cookies anymore after this, replace it with sessions instead