## redirecting

when we're redirecting a browser on the web to a new location we always send:

- a status code of `302`
- and a URL of the new location to be redirected to
- browser automatically issues a new request upon receiving the status code and new URL

It's common to redirect when we have created or updated some data eg. when a website redirect a user to an order confirmation page after a payment form has been successfully submitted.

the `redirect` method sets the `Location` header in the HTTP response and the status code to `3xx` (codes 301 and 302 are the most common for redirection) 

```ruby
get '/company/history' do
  redirect('/company/about-us')
end
```

- Sinatra does the work for us and doesn't need the status code, just the URL

```ruby
get '/products/:id' do
  if params[:id].to_i > 1000
    redirect('not-found')
  end
  # ...
end
```

- You can also use an if statement with a condition to redirect only when necessary

```ruby
get '/lynda' do
  redirect('http://lynda.com')
end
```

- we can also redirect to another website if we wanted to (doesn't have to be ours)

### Not found

Sinatra also provides another route called `not_found` devoted to pages that are not found on the website. It will be called whenever it can't find any other to match an incoming request with. This is commonly used to build custom "Page not found" pages. 

```ruby
not_found do
  "That page was not found"
end
```

 

### Edge cases

```ruby
get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect("/") if @contents.length < number
end
```

Here is an edge case where if the user puts in a chapter that doesn't exist because it exceeds the number of available chapters, we can redirect them to the main page. If this edge case isn't handled it will raise an error