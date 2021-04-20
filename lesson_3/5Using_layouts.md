## How to use layouts

render templates inside common page elements

- HTML head
- header
- footer
- nav
- sidebar

It renders first, `yield` to a template and then finishes

Sinatra works with the concept of a **layout** - Which is like a view template that wraps itself around another view template. It's very typical to put shared / common HTML code in a layout so that all that's in a view template is unique to that view/page.

This one HTML page:

```html
<html>
  <head>
    <title>Is it your birthday?</title>
  </head>
  <body>
    <p>Yes, it is!</p>
  </body>
</html>
```



Can be broken up into a layout that will `yield`...

```erb
<html>
  <head>
    <title>Is it your birthday?</title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>
```



...to a view template:

```erb
<p>Yes, it is!</p>
```

The `yield` keyword is used in layouts to indicate where the content from the view template will end up

### specifying layouts

To specify which layout you want to use, pass an addition argument to the `erb` call:

```ruby
get '/' do
  erb :index, layout: :post
end
```

Here Sinatra will look for a layout called `post.erb` in the `views` directory and use this to wrap the `index.erb` template

### default layouts

Sinatra is familiar with `layout.erb` it a magic name that it knows how to use it and what its purpose is for.

if you don't specify a layout the layout defaults to `layout.erb` 

```ruby
get '/' do
  erb :index # layout.erb is used by default
end
```

If you want to use a different named layout pass in another name like so:

```ruby
get '/company/about-us' do
  erb :about_us, :layout => :public
end
```

### No layouts

If you don't want the layout to be used simply write:

```ruby
get '/company/about-us' do
  erb :about_us, :layout => false
end
```

This tells `.erb` not to process the layout page