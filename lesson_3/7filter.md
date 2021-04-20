## Filters

- evaluate code before or after a route
- ability to modify the request and response if need be
- set instance variables for routes and templates

```ruby
before do
  @username = session[:username] || 'guest'
  @lanugage = 'English'
end

get '/language' do
  "Language setting: #{@language}"
end

after do 
  session[:last_request] = Time.now.to_s
end
```

- `before` and `after` blocks are executed before and after every route in sinatra

### Add custom code

we can add very specific patterns right after `before` or `after` that will only execute if the pattern matches

```ruby
before '/staff/*' do
  authenticate_user
end

after '/products/:page' do |page|
  session[:current_page] = page
end
```

### Before filters

- There are many tasks that we need to do before every request to an application. This includes:
  - checking to see if a user is logged in or loading their account
  - moving common code (like sidebars, navigation headers etc) so it only needs to be defined once in our program
- if code is present in the `layout` of a program, its often a good candidate to move it inside a `before` filter to make it globally available. 
- This isn't always the case though as the `@title` is not designed to be global and we want it to change everytime we reach a new page. it is therefore dependent on the route matched to it which is why we have to define it in each route.